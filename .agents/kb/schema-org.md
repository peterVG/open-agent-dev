---
type: Reference
title: Schema.org — Structured Data Vocabulary Reference
description: Agent-facing synthesis of Schema.org v30.1: type system, data model, serialisation formats, usage patterns, agent constraints, and complete type hierarchy overview.
resource: https://schema.org
tags: [schema.org, structured-data, json-ld, microdata, rdfa, seo, semantic-web, type-hierarchy]
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-20T00:00:00Z
sources:
  - id: schemaorg-docs
    resource: https://schema.org/docs/documents.html
    title: Schema.org Documentation Index
    author: process:schema.org
  - id: schemaorg-datamodel
    resource: https://schema.org/docs/datamodel.html
    title: Schema.org Data Model
    author: process:schema.org
  - id: schemaorg-full
    resource: https://schema.org/docs/full.html
    title: Schema.org Full Type Hierarchy
    author: process:schema.org
  - id: schemaorg-thing
    resource: https://schema.org/Thing
    title: Schema.org Thing type
    author: process:schema.org
  - id: schemaorg-org
    resource: https://schema.org/Organization
    title: Schema.org Organization type
    author: process:schema.org
  - id: schemaorg-place
    resource: https://schema.org/Place
    title: Schema.org Place type
    author: process:schema.org
  - id: schemaorg-product
    resource: https://schema.org/Product
    title: Schema.org Product type
    author: process:schema.org
  - id: schemaorg-medical
    resource: https://schema.org/MedicalEntity
    title: Schema.org MedicalEntity type
    author: process:schema.org
kb-title: Schema.org — Structured Data Vocabulary Reference
source-url: https://schema.org/docs/documents.html
spec-version: "30.1"
last-updated: 2026-10-20T00:00:00Z
domain: Structured Data, Semantic Web, SEO, Knowledge Representation
---

# Schema.org — Structured Data Vocabulary Reference

**Purpose:** Reference for agents producing or consuming Schema.org structured data. Covers the type system, data model, serialisation formats, core usage rules, agent constraints, and a complete overview of all ~800 types organised by branch.

**TL;DR:** Schema.org is a collaborative, community-maintained vocabulary for adding machine-readable meaning to web content. It defines ~800 **types** in a multiple-inheritance hierarchy rooted at `Thing`, each with **properties** and typed **values**. Publishers embed it via **JSON-LD** (preferred), Microdata, or RDFa. Consumers (search engines, agents, tools) use it to infer entity meaning, enable rich results, and interlink data.[^schemaorg-docs]

---

## Novice Mental Model

| Everyday idea | Schema.org equivalent |
|---------------|----------------------|
| A category of thing | **Type** (e.g. `Person`, `Product`, `Event`) |
| A fact about a thing | **Property** (e.g. `name`, `price`, `startDate`) |
| The value of a fact | **Value** — another type, a text string, a URL, a number, or a date |
| Hierarchy of categories | **Type hierarchy** — `Thing` → `Organization` → `LocalBusiness` → `FoodEstablishment` |
| Multiple categories at once | Allowed: a type MAY have multiple parent types (multiple inheritance) |
| Machine-readable embedding | **JSON-LD** `<script type="application/ld+json">` block (preferred) |
| Canonical wire format | **RDF/Turtle**; Microdata and RDFa Lite express the same underlying model |

---

## Design Goals & Principles (Source: datamodel)[^schemaorg-datamodel]

1. **Pragmatic conformance** — Real-world data often deviates. Validators warn; they do not reject. Consumers are expected to be tolerant ("some data is better than none").
2. **Not a universal ontology** — Schema.org is meant for use alongside other vocabularies sharing its data model.
3. **Extensibility and reuse** — Types can be combined. An entity may carry properties from several types; type-property associations are guidelines, not strict rules.
4. **Incremental evolution** — Definitions are amended gradually; new properties are preferred over replacing existing ones.
5. **Identifiers via URLs** — Native URL/URI mechanisms (JSON-LD `@id`) are preferred over the textual `identifier` property.
6. **Multiple values** — Properties MAY hold multiple values (repeated tags in Microdata/RDFa; arrays in JSON-LD). RDF treats them as an unordered set by default.

---

## Data Model[^schemaorg-datamodel]

### Types
- Organised in a **multiple-inheritance hierarchy** rooted at `Thing`.
- A type MAY be a subtype of several parents simultaneously.
- Unknown types MUST be tolerated by consumers.

### Properties
- Each property declares **one or more domain types** (where it may appear) and **one or more range types** (what its value should be).
- Multiple domains/ranges avoid creating artificial intermediate types.
- Properties are inherited downward through the hierarchy.

### Values
- A value can be: another typed entity, a plain text string, a URL, a number, a date/time, or a boolean.
- When order matters, use JSON-LD `@list` or RDF ordered containers (`rdf:Seq`).

### Relationship to RDF
- The canonical representation is **RDF/Turtle**.
- **JSON-LD**, **Microdata**, and **RDFa Lite** all express the same underlying RDF model.
- Converting Microdata → RDFa Lite: rename `itemprop` → `property`, `itemtype` → `typeof`, drop `itemscope`, add `vocab` attribute.

---

## Serialisation Formats

| Format | How to embed | Recommended? |
|--------|-------------|--------------|
| **JSON-LD** | `<script type="application/ld+json">` in `<head>` or `<body>` | ✅ **Preferred** |
| **Microdata** | `itemscope`, `itemtype`, `itemprop` attributes on HTML elements | Supported |
| **RDFa Lite** | `vocab`, `typeof`, `property` attributes on HTML elements | Supported |

### Minimal JSON-LD example

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Executive Anvil",
  "description": "Sleeker than ACME's Classic Anvil.",
  "brand": {
    "@type": "Brand",
    "name": "ACME"
  },
  "offers": {
    "@type": "Offer",
    "price": "119.99",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock"
  }
}
```

---

## Core Vocabulary Layers

Schema.org ships three layers:

| Layer | Namespace prefix | Description |
|-------|-----------------|-------------|
| **Core** | `schema:` | Main vocabulary; shipped in every release |
| **Pending** | `pending:` | Newly proposed types/properties; may change |
| **Attic** | `attic:` | Deprecated items retained for backwards compatibility |

Domain-specific **extensions** are hosted under subdomains:

| Extension | URL | Domain |
|-----------|-----|--------|
| Health & medical | https://health-lifesci.schema.org | `MedicalEntity` subtypes |
| Automotive | https://auto.schema.org | Vehicle details |
| Bibliographic | https://bib.schema.org | Books, publications |
| Financial | https://pending.schema.org | Banks, loans, exchange rates |
| Hotels | https://schema.org/docs/hotels.html | `Hotel`, `HotelRoom` |

---

## Conformance Rules[^schemaorg-datamodel]

- Consumers **MUST** tolerate unknown types and unknown properties.
- Consumers **SHOULD** be tolerant of unexpected structures (partial annotation is acceptable).
- Publishers **SHOULD** use the most specific applicable type.
- Publishers **SHOULD** use JSON-LD for new implementations.
- Validators warn about issues but do not reject non-conformant data.
- `@id` **SHOULD** be a URL uniquely identifying the entity.

---

## Agent Implementation Rules

1. **Always include `@context`:** Set to `"https://schema.org"` for standard vocabulary.
2. **Use the most specific type:** Prefer `FoodEstablishment` over `LocalBusiness` over `Organization` when the entity is a restaurant.
3. **Multiple types are valid:** `"@type": ["NewsArticle", "Article"]` is legal.
4. **Properties are guidelines:** Consumers must not reject data with unexpected properties.
5. **Prefer `@id` for entity URIs:** Use a canonical URL to identify the entity.
6. **Use enumeration URIs for enumerated values:** e.g. `"availability": "https://schema.org/InStock"` (not the string `"InStock"`).
7. **Nested entities inline or by reference:** Use `{"@type": "...", ...}` inline or `{"@id": "..."}` for cross-references.
8. **Validate with official tools:** Use https://validator.schema.org to check markup.
9. **Tolerate missing properties:** No property is globally required; required fields are context-dependent (e.g. Google rich results have their own requirements).
10. **Never hard-code `schema:` prefix in JSON-LD** unless you also declare it in `@context`.

---

## Type Hierarchy Overview

The ~800 Schema.org types descend from a single root `Thing`. There are 11 direct children of `Thing`. Types support **multiple inheritance** — a type may descend from more than one parent. Always select the **most specific applicable type**.[^schemaorg-full]

### Root: `Thing`

Universal properties available on every type:

| Property | Range | Purpose |
|----------|-------|---------|
| `@id` / `url` | URL | Canonical identifier / page |
| `name` | Text | Display name |
| `description` | Text | Short description |
| `image` | URL / ImageObject | Representative image |
| `sameAs` | URL | Equivalent external URIs (Wikidata, etc.) |
| `identifier` | Text / URL / PropertyValue | External identifiers |
| `additionalType` | URL | Extra type from another vocabulary |
| `subjectOf` | CreativeWork / Event | Works about this entity |
| `potentialAction` | Action | Actions that can be performed |
| `mainEntityOfPage` | URL / WebPage | Primary page for this entity |

---

### Branch 1: `Action`

**Use when:** Describing something that can be done, was done, or is in progress.

| Type | Purpose |
|------|---------|
| `ConsumeAction` | Eat, drink, read, listen, watch, install |
| `CreateAction` | Cook, write, film, draw, photograph |
| `FindAction` | Check, discover, track, search |
| `InteractAction` | Communicate, comment, reply, invite, follow, join, leave |
| `ControlAction` | Activate, authenticate, login, reset password, suspend |
| `MoveAction` | Arrive, depart, travel |
| `TradeAction` | Buy, sell, rent, quote, pay, tip, pre-order |
| `TransferAction` | Borrow, donate, download, give, lend, send, receive, return |
| `UpdateAction` | Add, delete, replace, insert (append / prepend) |
| `OrganizeAction` | Allocate, apply, book, plan, cancel, reserve, schedule |
| `AssessAction` | Choose, vote, react, review, agree/disagree/like/dislike |
| `AchieveAction` | Win, lose, tie |
| `PlayAction` | Exercise, perform, play game |
| `SearchAction` | Structured search with query parameters |
| `SolveMathAction` | Math problem solving |
| `SeekToAction` | Jump to a position in media |

**Key properties:** `agent`, `object`, `result`, `startTime`, `endTime`, `actionStatus`, `target` (EntryPoint), `error`.

---

### Branch 2: `BioChemEntity`

**Use when:** Describing biological or chemical entities.

| Type | Purpose |
|------|---------|
| `ChemicalSubstance` | Chemicals and compounds |
| `Gene` | A gene |
| `MolecularEntity` | Molecular-level entities |
| `Protein` | Proteins |

**Key properties:** `biologicalRole`, `chemicalComposition`, `associatedDisease`, `hasBioPolymerSequence`.

---

### Branch 3: `CreativeWork`

**Use when:** Describing content, media, publications, or intellectual works.

#### Articles & Reports

| Type | Purpose |
|------|---------|
| `Article` | General article |
| `NewsArticle` | Journalism |
| `ScholarlyArticle` | Academic paper |
| `MedicalScholarlyArticle` | Medical literature |
| `TechArticle` / `APIReference` | Technical docs, API docs |
| `Report` | Formal report |
| `SatiricalArticle` | Satire |
| `BlogPosting` | Blog post |
| `LiveBlogPosting` | Live coverage |
| `SocialMediaPosting` / `DiscussionForumPosting` | Social content |

#### Books & Long-form

| Type | Purpose |
|------|---------|
| `Book` / `Audiobook` | Books |
| `Chapter` | Book chapter |
| `Thesis` | Academic thesis |
| `Manuscript` | Unpublished manuscript |
| `ShortStory` | Fiction |
| `SequentialArt` / `ComicIssue` / `ComicStory` | Comics |

#### Series & Seasons

| Type | Purpose |
|------|---------|
| `BookSeries` / `ComicSeries` | Publication series |
| `TVSeries` / `TVEpisode` / `Season` | Television |
| `RadioSeries` / `RadioEpisode` | Radio |
| `PodcastSeries` / `PodcastEpisode` | Podcasts |
| `VideoGameSeries` | Video game franchises |
| `MovieSeries` | Film franchises |
| `Periodical` / `Newspaper` | Periodic publications |
| `PublicationIssue` / `PublicationVolume` | Issue/volume |

#### Clips & Media

| Type | Purpose |
|------|---------|
| `Clip` (MovieClip, RadioClip, TVClip, VideoGameClip) | Short segments |
| `Movie` | Films |
| `MediaObject` | Generic media file |
| `AudioObject` | Audio files |
| `VideoObject` | Video files |
| `ImageObject` / `Barcode` | Images |
| `DataDownload` | Downloadable data files |
| `TextObject` | Text content |
| `3DModel` | 3D assets |
| `MusicVideoObject` | Music videos |

#### Software

| Type | Purpose |
|------|---------|
| `SoftwareApplication` | Apps generally |
| `MobileApplication` | Mobile apps |
| `WebApplication` | Web apps |
| `VideoGame` | Games |
| `OperatingSystem` | OS |
| `SoftwareSourceCode` | Source code |

#### Music

| Type | Purpose |
|------|---------|
| `MusicComposition` | Musical works |
| `MusicRecording` | Recorded tracks |
| `MusicAlbum` | Albums |
| `MusicPlaylist` | Playlists |
| `MusicRelease` | Release editions |
| `SheetMusic` | Printed music scores |

#### Visual Arts

| Type | Purpose |
|------|---------|
| `VisualArtwork` | Artworks generally |
| `Painting` | Paintings |
| `Photograph` | Photographs |
| `Sculpture` | Sculptures |
| `Drawing` | Drawings |
| `Poster` | Posters |
| `CoverArt` / `ComicCoverArt` | Cover artwork |

#### Web Content

| Type | Purpose |
|------|---------|
| `WebSite` | A website |
| `WebPage` | A single web page |
| `AboutPage` / `ContactPage` / `FAQPage` | Specialised pages |
| `ItemPage` | Product/item detail page |
| `ProfilePage` | User/author profile |
| `QAPage` / `SearchResultsPage` | Q&A and search pages |
| `CheckoutPage` / `CollectionPage` | Commerce pages |
| `MedicalWebPage` / `RealEstateListing` | Domain-specific pages |
| `WebPageElement` | Sub-page components |
| `WebContent` / `HealthTopicContent` | Web-delivered content |

#### Education & How-To

| Type | Purpose |
|------|---------|
| `HowTo` | Step-by-step instructions |
| `Recipe` | Cooking recipes |
| `Course` | Educational course |
| `LearningResource` | Learning materials |
| `Quiz` / `ExercisePlan` | Assessment and fitness |
| `Syllabus` | Course syllabus |

#### Data

| Type | Purpose |
|------|---------|
| `Dataset` | A data set |
| `DataCatalog` | Collection of datasets |
| `DataFeed` | Live data feed |

#### Reviews, Comments & Q&A

| Type | Purpose |
|------|---------|
| `Review` | General review |
| `CriticReview` | Professional critic review |
| `UserReview` | Consumer review |
| `ClaimReview` | Fact-check |
| `MediaReview` | Media accuracy review |
| `EmployerReview` | Employer review |
| `Recommendation` | Recommendations |
| `Comment` / `Answer` / `Question` | Discussion items |
| `CorrectionComment` | Corrections |
| `Conversation` | Thread |

#### Other CreativeWork subtypes

| Type | Purpose |
|------|---------|
| `Claim` / `Statement` | Factual claims |
| `Diet` | Dietary information |
| `Legislation` / `LegislationObject` | Legal texts |
| `Map` | Maps |
| `Message` / `EmailMessage` | Messages |
| `Quotation` | Quotes |
| `Guide` | Guides |
| `Menu` / `MenuSection` | Restaurant menus |
| `DigitalDocument` | Digital files (with subtypes) |
| `DefinedTermSet` / `CategoryCodeSet` | Controlled vocabularies |
| `SpecialAnnouncement` | Emergency/COVID-19 announcements |
| `EducationalOccupationalCredential` | Credentials/certifications |
| `MathSolver` | Math solving tools |
| `HyperToc` / `HyperTocEntry` | Table of contents |
| `AmpStory` | AMP story format |
| `ArchiveComponent` | Archival components |
| `Play` | Theatrical plays |

**Key properties:** `author`, `datePublished`, `dateModified`, `headline`, `keywords`, `inLanguage`, `license`, `publisher`, `isPartOf`, `hasPart`, `about`, `audience`, `encoding`, `contentUrl`, `thumbnailUrl`.

---

### Branch 4: `Event`

**Use when:** Describing occurrences scheduled in time.

| Type | Purpose |
|------|---------|
| `BusinessEvent` | Corporate events |
| `ChildrensEvent` | Events for children |
| `ComedyEvent` | Comedy shows |
| `ConferenceEvent` | Conferences |
| `CourseInstance` | A scheduled run of a `Course` |
| `DanceEvent` | Dance performances |
| `DeliveryEvent` | Package delivery events |
| `EducationEvent` | Educational events |
| `EventSeries` | Recurring event series |
| `ExhibitionEvent` | Art/museum exhibitions |
| `Festival` | Festivals |
| `FoodEvent` | Food/drink events |
| `Hackathon` | Hackathons |
| `LiteraryEvent` | Book readings, literary gatherings |
| `MusicEvent` | Concerts |
| `PerformingArtsEvent` | Theatre, opera |
| `PublicationEvent` | Media broadcasts, book launches |
| `BroadcastEvent` / `OnDemandEvent` | Broadcasts |
| `SaleEvent` | Sales/clearances |
| `ScreeningEvent` | Film screenings |
| `SocialEvent` | Social gatherings |
| `SportsEvent` | Sporting events |
| `TheaterEvent` | Theatre performances |
| `VisualArtsEvent` | Gallery openings |
| `UserInteraction` (+ subtypes) | Social media interactions |

**Key properties:** `startDate`, `endDate`, `location`, `organizer`, `performer`, `eventStatus`, `eventAttendanceMode`, `offers`, `recordedIn`.

---

### Branch 5: `Intangible`

**Use when:** Describing abstract concepts, enumerations, specifications, and other non-physical entities.

| Category | Key types |
|----------|-----------|
| **Audience** | `Audience`, `BusinessAudience`, `EducationalAudience`, `MedicalAudience`, `Patient`, `ParentAudience`, `Researcher` |
| **Broadcast** | `BroadcastChannel`, `RadioChannel` (AM/FM), `TelevisionChannel`, `BroadcastFrequencySpecification` |
| **Commerce** | `Offer`, `Demand`, `Ticket`, `Invoice`, `PriceSpecification`, `UnitPriceSpecification`, `DeliveryChargeSpecification` |
| **Commerce specs** | `ActionAccessSpecification`, `AlignmentObject`, `BedDetails`, `DigitalDocumentPermission`, `EnergyConsumptionDetails` |
| **Enumerations** | `DayOfWeek`, `GenderType`, `ItemAvailability`, `PaymentMethod`, `OrderStatus`, `ReservationStatus`, `EventStatus`, `GamePlayMode` |
| **Medical enumerations** | `MedicalSpecialty`, `MedicalTrialDesign`, `MedicineSystem`, `DrugPrescriptionStatus`, `MedicalEvidenceLevel` |
| **Education** | `EducationalOccupationalProgram`, `AlignmentObject` |
| **Other** | `Brand`, `ComputerLanguage`, `DataFeedItem`, `EntryPoint`, `Language`, `Permit`, `Role`, `Schedule`, `Seat`, `Series`, `SizeSpecification`, `StatisticalVariable`, `Quantity`, `Mass`, `Distance`, `Duration`, `Energy` |

---

### Branch 6: `MedicalEntity`

**Use when:** Describing health and medical domain entities. Requires the Health & Life Sciences extension.[^schemaorg-medical]

| Type | Purpose |
|------|---------|
| `AnatomicalStructure` | Body parts |
| `AnatomicalSystem` | Body systems |
| `DrugClass` | Drug classification |
| `DrugCost` | Medication pricing |
| `LifestyleModification` | Diet, exercise recommendations |
| `MedicalCause` | Disease causes |
| `MedicalCondition` | Diseases and conditions |
| `MedicalContraindication` | What to avoid |
| `MedicalDevice` | Medical equipment |
| `MedicalGuideline` | Clinical guidelines |
| `MedicalIndication` | What something treats |
| `MedicalIntangible` | Abstract medical concepts |
| `MedicalProcedure` | Medical procedures |
| `MedicalRiskEstimator` | Risk tools |
| `MedicalRiskFactor` | Risk factors |
| `MedicalStudy` | Clinical studies |
| `MedicalTest` | Diagnostic tests |
| `Substance` | Drugs and substances |
| `SuperficialAnatomy` | Surface anatomy |

---

### Branch 7: `Organization`

**Use when:** Describing companies, institutions, groups, or bodies.[^schemaorg-org]

| Type | Purpose |
|------|---------|
| `Airline` | Airlines |
| `Consortium` | Consortia |
| `Cooperative` | Cooperatives |
| `Corporation` | Corporations |
| `EducationalOrganization` | Schools, universities |
| `FundingScheme` | Funding programs |
| `GovernmentOrganization` | Government bodies |
| `LibrarySystem` | Library networks |
| `LocalBusiness` | Physical business locations *(see below)* |
| `MedicalOrganization` | Hospitals, clinics |
| `NGO` | Non-governmental organizations |
| `NewsMediaOrganization` | News outlets |
| `OnlineBusiness` | Online-only businesses |
| `PerformingGroup` | Bands, theatre groups |
| `PoliticalParty` | Political parties |
| `Project` | Projects |
| `ResearchOrganization` | Research institutes |
| `SearchRescueOrganization` | Emergency services |
| `SportsOrganization` / `SportsTeam` | Sports bodies |
| `WorkersUnion` | Trade unions |

#### `LocalBusiness` subtypes (30 types)

Physical business locations; use the most specific type:

| Type | Examples |
|------|---------|
| `FoodEstablishment` | Restaurant, CafeOrCoffeeShop, FastFoodRestaurant, Bakery, BarOrPub |
| `LodgingBusiness` | Hotel, Hostel, BedAndBreakfast, Campground, Motel |
| `HealthAndBeautyBusiness` | BeautySalon, HairSalon, NailSalon, TattooParlor, DaySpa |
| `FinancialService` | Bank, InsuranceAgency, AccountingService, AutomatedTeller |
| `Store` | ClothingStore, ElectronicsStore, BookStore, GroceryStore, HardwareStore |
| `SportsActivityLocation` | GolfCourse, GymOrHealthClub, TennisCourt, SkiResort |
| `EntertainmentBusiness` | AmusementPark, ArtGallery, Casino, ComedyClub, MovieTheater, NightClub |
| `AutomotiveBusiness` | AutoBodyShop, AutoDealer, AutoPartsStore, CarWash, GasStation |
| `HomeAndConstructionBusiness` | Electrician, GeneralContractor, HVACBusiness, Locksmith, Plumber, RoofingContractor |
| `MedicalBusiness` | Optician, Pharmacy, Physician, VeterinaryCare |
| `LegalService` | Attorney, Notary |
| `GovernmentOffice` | PostOffice |
| Others | `AnimalShelter`, `ArchiveOrganization`, `ChildCare`, `Dentist`, `DryCleaningOrLaundry`, `EmergencyService`, `EmploymentAgency`, `InternetCafe`, `Library`, `ProfessionalService`, `RadioStation`, `RealEstateAgent`, `RecyclingCenter`, `SelfStorage`, `ShoppingCenter`, `TelevisionStation`, `TouristInformationCenter`, `TravelAgency` |

**Key properties for Organization:** `name`, `address`, `telephone`, `email`, `url`, `logo`, `employee`, `foundingDate`, `numberOfEmployees`, `legalName`, `taxID`, `vatID`, `openingHours`.

---

### Branch 8: `Person`

**Use when:** Describing individual people (real or fictional).

Subtypes: `Patient` (also under `MedicalAudience`)

**Key properties:** `name`, `givenName`, `familyName`, `birthDate`, `deathDate`, `gender`, `nationality`, `email`, `telephone`, `address`, `jobTitle`, `worksFor`, `affiliation`, `alumniOf`, `knows`, `sameAs`, `image`.

---

### Branch 9: `Place`

**Use when:** Describing physical locations.[^schemaorg-place]

| Type | Purpose |
|------|---------|
| `Accommodation` | Hotel rooms, apartments, houses for short stays |
| `AdministrativeArea` | Countries, states, cities (City, Country, State) |
| `CivicStructure` | Airports, parks, hospitals, museums, stadiums |
| `DefinedRegion` | Delivery zones, postal areas |
| `Landform` | Continents, bodies of water, mountains |
| `LandmarksOrHistoricalBuildings` | Heritage sites |
| `LocalBusiness` | Physical businesses *(also under Organization)* |
| `Residence` | Private homes, apartments |
| `TouristAttraction` | Tourist spots |
| `TouristDestination` | Destinations |

**Key properties:** `address` (PostalAddress), `geo` (GeoCoordinates / GeoShape), `hasMap`, `latitude`, `longitude`, `openingHoursSpecification`, `photo`, `containedInPlace`, `containsPlace`.

---

### Branch 10: `Product`

**Use when:** Describing goods for sale or use.[^schemaorg-product]

| Type | Purpose |
|------|---------|
| `DietarySupplement` | Nutritional supplements |
| `Drug` | Pharmaceuticals |
| `IndividualProduct` | A specific product instance (with serial number) |
| `ProductCollection` | Collections of products (also under CreativeWork) |
| `ProductGroup` | A product with variants (e.g. shirt in different sizes) |
| `ProductModel` | A specific model/version |
| `SomeProducts` | A partial/indefinite quantity of a product |
| `Vehicle` | Cars, trucks, boats |

**Key properties:** `name`, `description`, `brand`, `sku`, `gtin`, `gtin8`, `gtin13`, `gtin14`, `mpn`, `offers`, `aggregateRating`, `review`, `image`, `color`, `weight`, `width`, `height`, `depth`, `material`, `model`, `manufacturer`, `isRelatedTo`, `isSimilarTo`.

---

### Branch 11: `Taxon`

**Use when:** Describing biological taxonomy.

Subtypes: none defined in core; used directly for species, genera, etc.

**Key properties:** `name`, `taxonRank`, `parentTaxon`, `childTaxon`, `scientificName`, `alternateName`.

---

## Type Selection Decision Table

| The entity is… | Use this type |
|----------------|---------------|
| A business with a physical location | `LocalBusiness` or subtype |
| A restaurant | `FoodEstablishment` → `Restaurant` |
| A hotel | `LodgingBusiness` → `Hotel` |
| A company (no physical location) | `Organization` → `Corporation` |
| A government body | `GovernmentOrganization` |
| A news article | `NewsArticle` |
| An academic paper | `ScholarlyArticle` |
| A blog post | `BlogPosting` |
| A recipe | `Recipe` |
| A how-to guide | `HowTo` |
| A product for sale | `Product` (+ `Offer`) |
| A physical place | `Place` subtype |
| A country or city | `Country` or `City` (under `AdministrativeArea`) |
| A real person | `Person` |
| A scheduled event | `Event` subtype |
| A dataset | `Dataset` |
| A software app | `SoftwareApplication` |
| A video | `VideoObject` |
| A review | `Review` (or `CriticReview` / `UserReview`) |
| A medical condition | `MedicalCondition` |
| A drug/medication | `Drug` (Product) |
| A job posting | `JobPosting` (Intangible) |
| A FAQ page | `FAQPage` + `Question` + `Answer` |
| A breadcrumb list | `BreadcrumbList` + `ListItem` |

---

## Resources

| Resource | Purpose |
|----------|---------|
| [Schema.org](https://schema.org) | Canonical vocabulary browser |
| [Full type hierarchy](https://schema.org/docs/full.html) | All ~800 types in one page |
| [Validator](https://validator.schema.org) | Official structured data validator |
| [Releases](https://schema.org/docs/releases.html) | Version history |
| [Data model](https://schema.org/docs/datamodel.html) | RDF/data model notes |
| [GitHub](https://github.com/schemaorg/schemaorg) | Source; issue tracker |

[^schemaorg-docs]: Schema.org Documentation Index — https://schema.org/docs/documents.html
[^schemaorg-datamodel]: Schema.org Data Model — https://schema.org/docs/datamodel.html
[^schemaorg-full]: Schema.org Full Type Hierarchy — https://schema.org/docs/full.html
[^schemaorg-medical]: Schema.org MedicalEntity — https://schema.org/MedicalEntity
[^schemaorg-org]: Schema.org Organization — https://schema.org/Organization
[^schemaorg-place]: Schema.org Place — https://schema.org/Place
[^schemaorg-product]: Schema.org Product — https://schema.org/Product
