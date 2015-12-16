package DDG::Spice::Soccer;
# ABSTRACT: Write an abstract here
# Start at https://duck.co/duckduckhack/spice_overview if you are new
# to instant answer development

use DDG::Spice;

# Caching - https://duck.co/duckduckhack/spice_advanced_backend#caching-api-responses
spice is_cached => 1;

# Metadata.  See https://duck.co/duckduckhack/metadata for help in filling out this section.
name "Soccer";
# source "";
# icon_url "";
description "Gets soccer schedule for EPL";
primary_example_queries "epl schedule", "epl";
secondary_example_queries "premier league";
# Uncomment and complete: https://duck.co/duckduckhack/metadata#category
category "time_sensitive";
# Uncomment and complete: https://duck.co/duckduckhack/metadata#topics
topics "social", "entertainment", "special_interest";
code_url "https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Soccer.pm";
attribution github => ["akshaymankar", "Akshay Mankar"],
            twitter => "akshaymankar";

# API endpoint - https://duck.co/duckduckhack/spice_attributes#spice-codetocode
spice wrap_jsonp_callback => 1;
spice to => 'http://api.football-data.org/alpha/soccerseasons/398/fixtures';

# Triggers - https://duck.co/duckduckhack/spice_triggers
triggers any => "epl", "premier league";

# Handle statement
handle remainder => sub {

    # optional - regex guard
    # return unless qr/^\w+/;

    return unless $_;    # Guard against "no answer"

    return $_;
};

1;
