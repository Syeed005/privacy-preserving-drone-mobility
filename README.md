# Privacy-preserving Drone Mobility
Simulate two simple mobility models: Random Waypoint (RWP) and Privacy-Preserving Random (PPR). In RWP, a drone chooses a random destination within a 1,000 x 1,000 (m2) network, 2-dimensional network. The drone flies toward the destination. Upon arrival, the drone stays during a pausing time. Then the drone chooses another random destination within the network and flies toward the destination. The drone repeats the same procedure. In PPR, a drone chooses a random destination within the network. Rather than flying straight to the destination, the drone builds a virtual rectangle with a diagonal starting from its current location to the destination and generates several dummy locations (k) located with the rectangle. Then the drone flies toward the destination through all the dummy locations, e.g., from the closest located dummy location
first.

# How to run the program

- Run the function with arguments like - mobility(0,2,5,0)
- 1st argument is for type. E.g- 0 for RWP and 1 for PPR
- 2nd argument is for velocity. E.g- 2 means 2m/s
- 3rd argument is for pausing time
- 4th argument is for the number of dummy locations

# Sample Results Graphs
- mobility(0,3,2,0) with number of line parameters : 5
  
   ![image](https://github.com/Syeed005/privacy-preserving-drone-mobility/assets/124804545/92ba10d7-59e7-40e3-9b84-e3c2fc364d25)

- mobility(0,1,5,0) with number of line parameters : 4
  
   ![image](https://github.com/Syeed005/privacy-preserving-drone-mobility/assets/124804545/0f14bbaa-d605-4d87-9f17-4b8a39f2f9ea)

- mobility(1,3,3,5) with number of line parameters : 5

  ![image](https://github.com/Syeed005/privacy-preserving-drone-mobility/assets/124804545/d97b5c8a-43f3-40c8-b807-0b09d7238942)

- mobility(1,2,4,2) with number of line parameters : 3

  ![image](https://github.com/Syeed005/privacy-preserving-drone-mobility/assets/124804545/0c45d34c-7f4b-4bec-ae55-9a0f92b66281)



