module ApplicationHelper
    # Return the full title on a per-page basis
    def full_title(page_title = '')
        base_title = "Ecommerce"
        if page_title.empty?
            base_title 
        else
            page_title + " | " + base_title
        end
    end

    def render_stars(value)
        output = ''
        if (1..5).include?(value.to_i)
          value.to_i.times { output += '*'}
        end
        output
    end
end
