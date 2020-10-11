local aspect = {

    -- Tier 0
    aer = {
        label = "Aer",
        name = "gaseousaeressentia",
        tier = 0,
    },
    terra = {
        label = "Terra",
        name = "gaseousterraessentia",
        tier = 0
    },
    aqua = {
        label = "Aqua",
        name = "gaseousaquaessentia",
        tier = 0
    },
    ignis = {
        label = "Ignis",
        name = "gaseousignisessentia",
        tier = 0
    },
    ordo = {
        label = "Ordo",
        name = "gaseousordoessentia",
        tier = 0
    },
    perditio = {
        label = "Perditio",
        name = "gaseousperditioessentia",
        tier = 0
    },

    -- Tier 1

    gelum = {
        label = "Gelum",
        name = "gaseousgelumessentia",
        tier = 1
    },
    lux = {
        label = "Lux",
        name = "gaseousluxessentia",
        tier = 1
    },
    motus = {
        label = "Motus",
        name = "gaseousmotusessentia",
        tier = 1
    },
    permutatio = {
        label = "Permutatio",
        name = "gaseouspermutatioessentia",
        tier = 1
    },
    potentia = {
        label = "Potentia",
        name = "gaseouspotentiaessentia",
        tier = 1
    },
    tempestas = {
        label = "Tempestas",
        name = "",
        tier = 1
    },
    vacuos = {
        label = "Vacuos",
        name = "gaseousvacuosessentia",
        tier = 1
    },
    venenum = {
        label = "Venenum",
        name = "gaseousvenenumessentia",
        tier = 1
    },
    victus = {
        label = "Victus",
        name = "gaseousvictusessentia",
        tier = 1
    },
    vitreus = {
        label = "Vitreus",
        name = "gaseousvitreusessentia",
        tier = 1
    },

    -- Tier 2

    bestia = {
        label = "Bestia",
        name = "gaseousbestiaessentia",
        tier = 2
    },
    fames = {
        label = "Fames",
        name = "gaseousfamesessentia",
        tier = 2
    },
    herba = {
        label = "Herba",
        name = "gaseousherbaessentia",
        tier = 2
    },
    iter = {
        label = "Iter",
        name = "gaseousiteressentia",
        tier = 2
    },
    limus = {
        label = "Limus",
        name = "gaseouslimusessentia",
        tier = 2
    },
    metallum = {
        label = "Metallum",
        name = "gaseousmetallumessentia",
        tier = 2
    },
    mortuus = {
        label = "Mortuus",
        name = "gaseousmortuusessentia",
        tier = 2
    },
    praecantatio = {
        label = "Praecantatio",
        name = "gaseouspraecantatioessentia",
        tier = 2
    },
    sano = {
        label = "Sano",
        name = "gaseoussanoessentia",
        tier = 2
    },
    tenebrae = {
        label = "Tenebrae",
        name = "gaseoustenebraeessentia",
        tier = 2
    },
    vinculum = {
        label = "Vinculum",
        name = "gaseousvinculumessentia",
        tier = 2
    },
    volatus = {
        label = "Volatus",
        name = "gaseousvolatusessentia",
        tier = 2
    },
    tempus = {
        label = "Tempus",
        name = "gaseoustempusessentia",
        tier = 2
    },

    -- Tier 3

    alienis = {
        label = "Alienis",
        name = "gaseousalienisessentia",
        tier = 3
    },
    arbor = {
        label = "Arbor",
        name = "gaseousarboressentia",
        tier = 3
    },
    auram = {
        label = "Auram",
        name = "gaseousauramessentia",
        tier = 3
    },
    corpus = {
        label = "Corpus",
        name = "gaseouscorpusessentia",
        tier = 3
    },
    exanimis = {
        label = "Exanimis",
        name = "gaseousexanimisessentia",
        tier = 3
    },
    spiritus = {
        label = "Spiritus",
        name = "gaseousspiritusessentia",
        tier = 3
    },
    vitium = {
        label = "Vitium",
        name = "gaseousvitiumessentia",
        tier = 3
    },

    -- Tier 4

    cognitio = {
        label = "Cognitio",
        name = "gaseouscognitioessentia",
        tier = 4
    },
    sensus = {
        label = "sensus",
        name = "gaseoussensusessentia",
        tier = 4
    },

    -- Tier 5

    humanus = {
        label = "Humanus",
        name = "gaseoushumanusessentia",
        tier = 5
    },

    -- Tier 6

    instrumentum = {
        label = "Instrumentum",
        name = "gaseousinstrumentumessentia",
        tier = 6
    },
    lucrum = {
        label = "Lucrum",
        name = "gaseouslucrumessentia",
        tier = 6
    },
    messis = {
        label = "Messis",
        name = "gaseousmessisessentia",
        tier = 6
    },
    perfodio = {
        label = "Perfodio",
        name = "gaseousperfodioessentia",
        tier = 6
    },

    -- Tier 7

    fabrico = {
        label = "Fabrico",
        name = "gaseousfabricoessentia",
        tier = 7
    },
    machina = {
        label = "Machina",
        name = "gaseousmachinaessentia",
        tier = 7
    },
    meto = {
        label = "Meto",
        name = "gaseousmetoessentia",
        tier = 7
    },
    pannus = {
        label = "Pannus",
        name = "gaseouspannusessentia",
        tier = 7
    },
    telum = {
        label = "Telum",
        name = "gaseoustelumessentia",
        tier = 7
    },
    tutamen = {
        label = "Tutamen",
        name = "gaseoustutamenessentia",
        tier = 7
    },
}

aspect.gelum.parents = {aspect.ignis, aspect.perditio}
aspect.lux.parents = {aspect.aer, aspect.ignis }
aspect.motus.parents = {aspect.aer, aspect.ordo }
aspect.permutatio.parents = {aspect.ordo, aspect.perditio }
aspect.potentia.parents = {aspect.ignis, aspect.ordo }
aspect.tempestas.parents = {aspect.aer, aspect.aqua }
aspect.vacuos.parents = {aspect.aer, aspect.perditio }
aspect.venenum.parents = {aspect.aqua, aspect.perditio }
aspect.victus.parents = {aspect.aqua, aspect.terra }
aspect.vitreus.parents = {aspect.ordo, aspect.terra }

aspect.bestia.parents = {aspect.motus, aspect.victus }
aspect.fames.parents = {aspect.vacuos, aspect.victus }
aspect.herba.parents = {aspect.terra, aspect.victus }
aspect.iter.parents = {aspect.motus, aspect.terra }
aspect.limus.parents = {aspect.aqua, aspect.victus }
aspect.metallum.parents = {aspect.terra, aspect.vitreus }
aspect.mortuus.parents = {aspect.perditio, aspect.victus }
aspect.praecantatio.parents = {aspect.potentia, aspect.vacuos }
aspect.sano.parents = {aspect.ordo, aspect.victus }
aspect.tenebrae.parents = {aspect.lux, aspect.vacuos }
aspect.vinculum.parents = {aspect.motus, aspect.perditio }
aspect.volatus.parents = {aspect.aer, aspect.motus }
aspect.tempus.parents = {aspect.vacuos, aspect.ordo}

aspect.alienis.parents = {aspect.tenebrae, aspect.vacuos }
aspect.arbor.parents = {aspect.aer, aspect.herba }
aspect.auram.parents = {aspect.aer, aspect.praecantatio }
aspect.corpus.parents = {aspect.bestia, aspect.mortuus }
aspect.exanimis.parents = {aspect.mortuus, aspect.motus }
aspect.spiritus.parents = {aspect.mortuus, aspect.victus }
aspect.vitium.parents = {aspect.perditio, aspect.praecantatio }

aspect.cognitio.parents = {aspect.ignis, aspect.spiritus }
aspect.sensus.parents = {aspect.aer, aspect.spiritus }

aspect.humanus.parents = {aspect.bestia, aspect.cognitio }

aspect.instrumentum.parents = {aspect.humanus, aspect.ordo }
aspect.lucrum.parents = {aspect.fames, aspect.humanus }
aspect.messis.parents = {aspect.herba, aspect.humanus }
aspect.perfodio.parents = {aspect.humanus, aspect.terra }

aspect.fabrico.parents = {aspect.humanus, aspect.instrumentum }
aspect.machina.parents = {aspect.instrumentum, aspect.motus }
aspect.meto.parents = {aspect.instrumentum, aspect.messis }
aspect.pannus.parents = {aspect.bestia, aspect.instrumentum }
aspect.telum.parents = {aspect.instrumentum, aspect.ignis }
aspect.tutamen.parents = {aspect.instrumentum, aspect.terra }

return aspect