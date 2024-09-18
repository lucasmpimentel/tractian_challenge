# Welcome to my TRACTIAN - Mobile Challenge!

Link para o *TRACTIAN* [Read-me](https://github.com/tractian/challenges/blob/main/mobile/README.md) aqui.

## Sumary

-   [Sumary](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#%C3%ADndice)
-   [General Description](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#descri%C3%A7%C3%A3o-geral)
-   [Prototype Presentation](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#apresenta%C3%A7%C3%A3o-do-prot%C3%B3tipo)
-   [Scope](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#escopo)
-   [Requirements](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#requisitos)
-   [What Could Be Better](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#o-que-poderia-ser-melhor)
-   [Challenges Faced](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#desafios-enfrentados)
-   [Tools Used in the Projec](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#ferramentas-utilizadas-no-projeto)
-   [Portuguese Version](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md#vers%C3%A3o-em-ingl%C3%AAs)

## General Description

This document contains the specifications for creating a mobile application that consumes data from **TRACTIAN** API and displays it in a tree structure. We have the presence of filters for name, criticality level, and sensor type. There is also a search bar.

The goal of this application is to provide a proper management and maintenance method to ensure the efficient operation of assets essentials to the operation of industries.

## Prototype Presentation

(video here)

## Scope

Developed a mobile application capable of serving the **iOS** and **Android** Operating Systems using the **Flutter** multiplatform framework where the **Dart** language is applied.

## Requirements

**1. Home Page**

This is the menu for users to navigate between different companies and access their assets.

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

- Refine the listing;
- Finalize the feature that applies the cache and add the offline database (SQLite for example);
- Better explore the use of isolates;
- Build more refined tests with broader coverage as a result;
- Add a details screen to the project containing information about the components based on the API.

## Challenges Faced

- Dealing with the purposefully disorganized API;
- Setting up the primary structure of the project;
- Use Flutter's recursion more efficiently.

## Tools Used in the Project

- **Clean Arch**: separate code responsibilities so that there is independence and greater focus on established business rules;
- **Dio**: simplified execution of requests;
- **Cubit**: simplified state management;
- **GetIt**: dependency injection;
- **Mocktail**: facilitate testing by creating mocks without the need to generate extra code.

## English version

Read-me in Portuguese [here](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#vers%C3%A3o-em-ingl%C3%AAs).
