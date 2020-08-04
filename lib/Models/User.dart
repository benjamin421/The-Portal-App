import 'dart:convert';

class User {
    User({
        this.data,
    });

    Data data;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? null : data.toMap(),
    };
}

class Data {
    Data({
        this.discordUser,
    });

    List<DiscordUser> discordUser;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        discordUser: json["DiscordUser"] == null ? null : List<DiscordUser>.from(json["DiscordUser"].map((x) => DiscordUser.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "DiscordUser": discordUser == null ? null : List<dynamic>.from(discordUser.map((x) => x.toMap())),
    };
}

class DiscordUser {
    DiscordUser({
        this.id,
        this.username,
        this.discriminator,
        this.avatar,
        this.skills,
    });

    String id;
    String username;
    String discriminator;
    String avatar;
    List<Skill> skills;

    factory DiscordUser.fromJson(String str) => DiscordUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DiscordUser.fromMap(Map<String, dynamic> json) => DiscordUser(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        discriminator: json["discriminator"] == null ? null : json["discriminator"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        skills: json["skills"] == null ? null : List<Skill>.from(json["skills"].map((x) => Skill.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "discriminator": discriminator == null ? null : discriminator,
        "avatar": avatar == null ? null : avatar,
        "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x.toMap())),
    };
}

class Skill {
    Skill({
        this.id,
        this.name,
        this.degree,
    });

    String id;
    String name;
    int degree;

    factory Skill.fromJson(String str) => Skill.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Skill.fromMap(Map<String, dynamic> json) => Skill(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        degree: json["degree"] == null ? null : json["degree"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "degree": degree == null ? null : degree,
    };
}
