# Welcome to my TRACTIAN - Mobile Challenge!

Link para o *TRACTIAN* [Read-me](https://github.com/tractian/challenges/blob/main/mobile/README.md) aqui.

## Sumary

-   [Sumary](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#sumary)
-   [General Description](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#general-description)
-   [Prototype Presentation](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#prototype-presentation)
-   [Scope](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#scope)
-   [Requirements](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#requirements)
-   [What Could Be Better](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#what-could-be-better)
-   [Challenges Faced](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#challenges-faced)
-   [Tools Used in the Projec](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#tools-used-in-the-project)
-   [Portuguese Version](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#english-version)

## General Description

This document contains the specifications for creating a mobile application that consumes data from the **TRACTIAN** API and displays it in a tree structure. We have filters for name, criticality level, and sensor type. There is also a search bar.

The goal is to provide a proper management and maintenance method to ensure the efficient and predictable operation of assets essential to the industries.

## Prototype Presentation

[untitled.webm](https://github.com/user-attachments/assets/6b89649d-5f54-42fe-916b-2f71065c4c4d)

## Scope

Develop a mobile application capable of serving the **iOS** and **Android** Operating Systems using the **Flutter** multiplatform framework where the **Dart** language is applied.

## Requirements

**1. Home Page**

This is the menu for users to navigate between different companies of the same client and access their assets.

**2. Assets Page**

- The Asset Tree is the main resource, offering a visual tree representation of the company's asset hierarchy.
- **Sub-resources:**

1. **Visualization**

- Present a dynamic tree structure displaying components, assets and locations.

2. **Filters**

**Text Search**

- Users can search for specific components/assets/locations within the asset hierarchy.

**Energy Sensors**

- Implement a filter to isolate energy sensors within the tree.

**Critical sensor status**

- Integrate a filter to identify assets with critical sensor status.

- When filters are applied, the asset's parents **cannot** be hidden. The user must know the entire path of the asset. Items that are not related to the asset's path should be hidden.

## What could be better

- Refine the listing to a better visualization;
- Finalize the search bar and filters 
- Finalize the feature that applies the cache and add the offline database (SQLite for example);
- Find a way to the use of the flutter isolates;
- Build more refined unit tests with broader coverage as a result;
- Add a details screen to the project containing information about the components based on the API.

## Challenges Faced

- Dealing with the purposefully disorganized API;
- Dealing with the cache of the API
- Setting up the primary structure of the project;
- Use Flutter's recursivity more efficiently.

## Tools Used in the Project


- **Clean Arch**: separating code responsibilities so that there is independence to better reuse of the code and more clarity on the business rules applied;
- **Dio**: simplified execution of requests;
- **Cubit**: simplified state management based on events;
- **GetIt**: dependency injection to improve the code decoupling;
- **Mocktail and Mokito**: To facilitate the unit testing by creating mocks without extra code.

## Portuguese version

Read-me in Portuguese [here](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#vers%C3%A3o-em-ingl%C3%AAs).
