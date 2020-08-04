const String uri = 'https://penrose.garden/graphql';

const String discord_cdn = 'https://cdn.discordapp.com';

const String portalQuery = r"""
        query PortalEpisodes{
          PortalEpisode{
            title
            guest
            date
            episodeNumber
            description
            imageURL
          }
        }
        """;
