package org.wiimart;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class Catalog {
    ArrayList<Title> titles = new ArrayList<>();
    HashMap<String, String> vcPlatformMap = new HashMap<>(Map.of(
        "fc/nes", "NES",
        "sfc/snes", "Super Nintendo",
        "n64", "Nintendo 64",
        "pce/tg16", "TurboGrafx16",
        "md/gen", "Sega Genesis",
        "sega genesis", "SEGA MEGA DRIVE",
        "neogeo", "NEOGEO",
        "master", "MASTER SYSTEM",
        "virtual console arcade", "Virtual Console Arcade",
        "commodore 64", "Commodore 64"
    ));
    HashMap<String, Map<String, String>> regions = new HashMap<>(Map.of(
        "USA", Map.of("en", "US", "es", "MX", "fr", "CA"),
        "EUR", Map.of("en", "GB", "de", "DE", "fr", "FR", "es", "ES", "it", "IT", "nl", "NL")
    ));

    HashMap<String, String> singleRegions = new HashMap<>(Map.of(
        "JPN", "JP",
        "KOR", "KR"
    ));
    public static int totalPages = 0;
    public String mapCountry(String region, String language) {
        if (region == null) return null;

        // direct single-value regions
        if (singleRegions.containsKey(region)) {
            return singleRegions.get(region);
        }

        // multi-value regions (language lookup)
        Map<String, String> map = regions.get(region);
        if (map == null || language == null) return null;
        return map.get(language);
    }
    public boolean isInEUR(String country) {
        return country.equals("gb") || country.equals("fr") || country.equals("de") || country.equals("es") || country.equals("it") || country.equals("nl");
    }
    public void info(Object x) {
        System.out.println("\u001B[32m[Catalog] " + x + "\u001B[0m");
    }
    public void warn(Object x) {
        System.out.println("\u001B[33m[Catalog] " + x + "\u001B[0m");
    }
    public void error(Object x) {
        System.out.println("\u001B[31m[Catalog] " + x + "\u001B[0m");
    }
    public void notice(Object x) {
        System.out.println("\u001B[34m[Catalog] " + x + "\u001B[0m");
    }
    public Catalog() throws IOException {
        JSONArray games = new JSONArray(new String(Files.readAllBytes(Paths.get("/root/www/oss/oss/common/js/games.json")), "UTF-8"));
        for (int i = 0; i < games.length(); i++) {
            JSONObject game = games.getJSONObject(i);
            Title title = new Title();
            title.titleId = game.getString("id");
            title.title1 = game.getString("title1");
            title.title2 = game.getString("title2");
            title.console = game.getString("console");
            title.controllers = game.getString("controllers");
            title.region = game.getString("region");
            title.language = game.getString("language");
            title.attributes = game.getString("attributes");
            title.date = game.getString("date");
            title.added = game.getString("added");
            title.publisher = game.getString("publisher");
            title.genre = game.getString("genre");
            title.points = game.getString("points");
            title.players = game.getString("players");
            title.rating = game.getString("rating");
            title.ratingDetails = game.getString("ratingdetails");
            title.titleSize = game.getString("size");
            title.thumbnail = game.getString("thumbnail");
            titles.add(title);
        }

    }

    public Title getTitle(HashMap<String, String> options) {
        String titleId = options.get("titleId");
        String language = options.get("language").toLowerCase();
        String region = options.get("region");
        if (language.equals("ja") || language.equals("jp")) language = "";
        String country = mapCountry(region, language);
        if (country == null) country = options.get("country");
        //String region = options.get("region");
        Title matchedTitle = new Title();
        for (Title title : titles) {
            if (title.titleId.equals(titleId) && title.language.toLowerCase().equals(language) 
                && title.region.toLowerCase().equals(country.toLowerCase())) {
                matchedTitle = title;
                matchedTitle.title1 = matchedTitle.title1.replaceAll("\'", "&apos;");
                matchedTitle.title2 = matchedTitle.title2.replaceAll("\'", "&apos;");
            }
        }
        return matchedTitle;
    }

    public ArrayList<Title> getTitles(HashMap<String, String> options) {
        String console = options.get("console").toLowerCase();
        String region = options.get("region");
        String language = options.get("language").toLowerCase();
        if (language.equals("ja") || language.equals("jp")) language = "";
        String country = mapCountry(region, language);
        String publisher = options.get("publisher").toLowerCase();
        String genre = options.get("genre").toLowerCase();
        String order = options.get("order").toLowerCase();
        String popular = options.get("popular").toLowerCase();
        String titleSearch = options.get("titleSearch").toLowerCase();
        String owned = options.get("owned").toLowerCase();
        String icr = options.get("icr").toLowerCase();
        List<String> titleIds = Arrays.asList(options.get("titleIds").split(";"));
        int page = Integer.parseInt(options.get("page"));
        int startIndex = (page - 1) * 10;
        int endIndex = startIndex + 10;
        //String region = options.get("region");
        boolean vc = Boolean.parseBoolean(options.get("vc"));
        String vcPlatforms = "Nintendo 64, NES, Super NES, Super Nintendo, Master System, Sega Genesis, NEOGEO, Virtual Console Arcade, TurboGrafx16, Commodore 64, MSX, Sega Mega Drive";
        ArrayList<Title> matchedTitles = new ArrayList<>();
        if (vc) {
            if (order.equals("new")) {
                for (int i = titles.size()-1; i > -1; i--) {
                    Title title = titles.get(i);
                    if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                    if (vcPlatforms.toLowerCase().contains(title.console.toLowerCase())) {
                        matchedTitles.add(title);
                    }
                }
            } else if (popular.equals("true")) {
                for (Title title : titles) {
                    if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                    if (!vcPlatforms.toLowerCase().contains(title.console.toLowerCase())) continue;
                    matchedTitles.add(title);
                }
            } else if (!publisher.equals("") || !genre.equals("")) {
                if (!publisher.equals("")) {
                    for (Title title : titles) {
                        if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                        if (!title.publisher.toLowerCase().equals(publisher)) continue;
                        matchedTitles.add(title);
                    }
                } else {
                    for (Title title : titles) {
                        if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                        if (!title.genre.toLowerCase().equals(genre)) continue;
                        matchedTitles.add(title);
                    }
                }
            } else if (!titleSearch.equals("")) {
                for (Title title : titles) {
                    if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                    if (!vcPlatforms.toLowerCase().contains(title.console.toLowerCase())) continue;
                    if (title.title1.toLowerCase().contains(titleSearch.toLowerCase())) {
                        matchedTitles.add(title);
                        continue;
                    }
                    if (title.title2.toLowerCase().contains(titleSearch.toLowerCase()))
                        matchedTitles.add(title);
                }
            } else {
                console = vcPlatformMap.get(console) != null ? vcPlatformMap.get(console) : console;
                if (console.toLowerCase().equals("sega mega drive") && !isInEUR(country.toLowerCase())) console = "sega genesis";
                //if (console != null && !vcPlatforms.toLowerCase().contains(console.toLowerCase())) return matchedTitles;
                for (Title title : titles) {
                    if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                    if (console == null) {
                        if (vcPlatforms.toLowerCase().contains(title.console.toLowerCase())) {
                            matchedTitles.add(title);
                        }
                        continue;
                    } 
                    if (console.equals("super nintendo") || console.equals("super nes")) {
                        if (title.console.equals("Super Nintendo") || title.console.equals("Super NES")) {
                            matchedTitles.add(title);
                        }
                    } else if (title.console.toLowerCase().equals(console.toLowerCase())) {
                        matchedTitles.add(title);
                    }
                }
            }
        } else if ((console.toLowerCase().equals("wiiware") || console.toLowerCase().equals("wii")) && (!owned.equals("true") && !icr.equals("true"))) {
            if (console.toLowerCase().equals("wii")) {
                String wiiVariants = "wii, canales wii, wii-kanal, wii-kanaal, canal de wii, chaîne wii, wii channel, canale wii, wii channels";
                for (Title title : titles) {
                    if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                    if (!wiiVariants.contains(title.console.toLowerCase())) continue;
                    matchedTitles.add(title);
                }
            } else {
                if (order.equals("new")) {
                    for (int i = titles.size()-1; i > -1; i--) {
                        Title title = titles.get(i);
                        if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language) || !title.console.toLowerCase().equals(console)) continue;
                        matchedTitles.add(title);
                    }
                } else if (!publisher.equals("") || !genre.equals("")) {
                    if (!publisher.equals("")) {
                        for (Title title : titles) {
                            if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language) || !title.console.toLowerCase().equals(console)) continue;
                            if (!title.publisher.toLowerCase().equals(publisher)) continue;
                            matchedTitles.add(title);
                        }
                    } else {
                        for (Title title : titles) {
                            if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language) || !title.console.toLowerCase().equals(console)) continue;
                            if (!title.genre.toLowerCase().equals(genre)) continue;
                            matchedTitles.add(title);
                        }
                    }
                } else if (!titleSearch.equals("")) {
                    for (Title title : titles) {
                        if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language) || !title.console.toLowerCase().equals(console)) continue;
                        if (title.title1.toLowerCase().contains(titleSearch.toLowerCase())) {
                            matchedTitles.add(title);
                            continue;
                        }
                        if (title.title2.toLowerCase().contains(titleSearch.toLowerCase()))
                            matchedTitles.add(title);
                    }
                } else {
                    for (Title title : titles) {
                        if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language) || !title.console.toLowerCase().equals(console)) continue;
                        matchedTitles.add(title);
                    }
                }
            }
        } else if (owned.equals("true")) {
            for (String titleId : titleIds) {
                HashMap<String, String> opts = new HashMap<>();
                opts.put("country", country);
                opts.put("language", language);
                opts.put("titleId", titleId);
                matchedTitles.add(getTitle(opts));
            }
        } else if (icr.equals("true")) {
            console = vcPlatformMap.get("fc/nes");
            publisher = "nintendo";
            for (Title title : titles) {
                if (!title.region.toLowerCase().equals(country.toLowerCase()) || !title.language.toLowerCase().equals(language)) continue;
                if (!title.publisher.toLowerCase().equals(publisher)) continue;
                if (!title.console.toLowerCase().equals(console.toLowerCase())) continue;
                matchedTitles.add(title);
            }
        }
        totalPages = (int) Math.ceil(matchedTitles.size() / 10) + 1;
        if (matchedTitles.size() < 10) return new ArrayList<>(matchedTitles.subList(0, matchedTitles.size()));
        if (endIndex > matchedTitles.size()) endIndex = matchedTitles.size();
        return new ArrayList<>(matchedTitles.subList(startIndex, endIndex));
    }

    public ArrayList<Title> getGifts(ArrayList<String> ids, HashMap<String, String> options) {
        String region = options.get("region");
        String language = options.get("language").toLowerCase();
        String country = mapCountry(region, language);
        int page = Integer.parseInt(options.get("page"));
        int startIndex = (page - 1) * 10;
        int endIndex = startIndex + 10;
        ArrayList<Title> matchedTitles = new ArrayList<>();
        for (String id : ids) {
            HashMap<String, String> opts = new HashMap<>();
            opts.put("country", country);
            opts.put("language", language);
            opts.put("titleId", id);
            matchedTitles.add(getTitle(opts));
        }
        totalPages = (int) Math.ceil(matchedTitles.size() / 10) + 1;
        if (matchedTitles.size() < 10) return new ArrayList<>(matchedTitles.subList(0, matchedTitles.size()));
        if (endIndex > matchedTitles.size()) endIndex = matchedTitles.size();
        return new ArrayList<>(matchedTitles.subList(startIndex, endIndex));
    }
}
