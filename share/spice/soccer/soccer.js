(function (env) {
    "use strict";
    env.ddg_spice_soccer = function(api_result){

        // Validate the response (customize for  your Spice)
        if (!api_result) {
            return Spice.failed('soccer');
        }
        
        var Fixture = function(fixture_data){
          return {
              date: new Date(fixture_data.date),
              home_team: 
          }  
        };
        
        var today = new Date();
        var matchday_before = api_result.fixtures.filter(function(fixture){
            return today > new Date(fixture.date);
        }).reduce(function(max_matchday, fixture){
            return max_matchday > fixture.matchday ? max_matchday : fixture.matchday; 
        }, -1);
        
        var matchday_after = matchday_before + 1;
        
        var before_fixtures = api_result.fixtures.filter(function(fixture){
           return fixture.matchday == matchday_before;
        });
        
        var after_fixtures = api_result.fixtures.filter(function(fixture){
            return fixture.matchday == matchday_after;
        });

        // Render the response
        Spice.add({
            id: "soccer",

            // Customize these properties
            name: "EPL Fixtures",
            data: {before_matchday: matchday_before,
                   after_matchday: matchday_after,
                   before_fixtures: before_fixtures, 
                   after_fixtures: after_fixtures},
            meta: {
                sourceName: "Football-Data.org",
                sourceUrl: 'http://api.football-data.org'
            },
            templates: {
                group: 'base',
                options: {
                    content: Spice.soccer.content,
                    moreAt: false
                }
            }
        });
    };
}(this));
