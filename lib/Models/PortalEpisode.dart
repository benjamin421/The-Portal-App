
import 'dart:convert';

PortalEpisode episodeFromJson(String str) => PortalEpisode.fromJson(json.decode(str));

String episodeToJson(PortalEpisode data) => json.encode(data.toJson());

class PortalEpisode {
    dynamic id;
    dynamic title;
    DateTime date;
    dynamic number;
    bool isSpecial;
    Links links;

    PortalEpisode({
        this.id,
        this.title,
        this.date,
        this.number,
        this.isSpecial,
        this.links,
    });

    factory PortalEpisode.fromJson(Map<String, dynamic> json) => PortalEpisode(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        number: json["number"] == null ? null : json["number"],
        isSpecial: json["is_special"] == null ? null : json["is_special"],
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "number": number == null ? null : number,
        "is_special": isSpecial == null ? null : isSpecial,
        "links": links == null ? null : links.toJson(),
    };
}

class Links {
    dynamic wiki;
    dynamic art19;
    dynamic mp3;
    dynamic youtube;
    dynamic blog;
    dynamic vtt;

    Links({
        this.wiki,
        this.art19,
        this.mp3,
        this.youtube,
        this.blog,
        this.vtt,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        wiki: json["wiki"] == null ? null : json["wiki"],
        art19: json["art19"] == null ? null : json["art19"],
        mp3: json["mp3"] == null ? null : json["mp3"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        blog: json["blog"] == null ? null : json["blog"],
        vtt: json["vtt"] == null ? null : json["vtt"],
    );

    Map<String, dynamic> toJson() => {
        "wiki": wiki == null ? null : wiki,
        "art19": art19 == null ? null : art19,
        "mp3": mp3 == null ? null : mp3,
        "youtube": youtube == null ? null : youtube,
        "blog": blog == null ? null : blog,
        "vtt": vtt == null ? null : vtt,
    };
}