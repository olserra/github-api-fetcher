module Search
    class SearchProfile
      def initialize(params)
        @params = params
      end
  
      def find
        Github.repos.list user: ("%#{@params[:search]}%")
      end
    end
  end