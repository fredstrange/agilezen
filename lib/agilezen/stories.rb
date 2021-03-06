module AgileZen
  # AgileZen::Stories module.
  module Stories
    
    # Retrieve information for all stories of a given project.
    def project_stories(project_id, options={})
      response_body = nil
      begin
        response = connection.get do |req|
          req.url "/api/v1/projects/#{project_id}/stories", options
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
    
    # Retrieve information for an individual story of a given project.
    def project_story(project_id, story_id, options={})
      response_body = nil
      begin
        response = connection.get do |req|
          req.url "/api/v1/projects/#{project_id}/stories/#{story_id}", options
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
    
    # Update information for an individual story of a given project.
    def update_project_story(project_id, story_id, data={})
      response_body = nil
      
      begin
        response = connection.put do |req|
          req.url "/api/v1/projects/#{project_id}/stories/#{story_id}"
          
          unless data.empty?           
            [:phase, :owner, :creator, :project].each do |item|
              data[item] = data[item].to_i if data[item].present?
            end       
            req.body = ActiveSupport::JSON.encode(data)
          end  
          
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
    
  end
  
end