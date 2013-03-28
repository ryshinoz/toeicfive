module Jpmobile
  class Resolver
    def query(path, details, formats)
      query = build_query(path, details)

      # deals with case-insensitive file systems.
      sanitizer = Hash.new { |h,dir| h[dir] = Dir["#{dir}/*"] }

      template_paths = Dir[query].reject { |filename|
        File.directory?(filename) ||
          !sanitizer[File.dirname(filename)].include?(filename)
      }

      template_paths.map { |template|
        handler, format = extract_handler_and_format(template, formats)
        contents = File.binread template

        if format
          variant = template.match(/.+#{path.to_s}(.+)\.#{format.to_sym.to_s}.*$/) ? $1 : '' if rails4?
          variant = template.match(/.+#{path}(.+)\.#{format.to_sym.to_s}.*$/) ? $1 : '' unless rails4?
          virtual_path = variant.blank? ? path.virtual : path.to_str + variant
        else
          virtual_path = path.virtual
        end

        ActionView::Template.new(contents, File.expand_path(template), handler,
          :virtual_path => virtual_path,
          :format       => format,
          :updated_at   => mtime(template))
      }
    end 

    private
    def rails_version
      @rails_version ||= `bundle exec rails -v`[/\d.+/]
    end

    def rails4?
      rails_version =~ /^4/
    end  
   
  end
end
