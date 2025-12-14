NameOfNetwork='Hybrid Topology';
NumberOfNodes=26;
StartingNodesOfConnection=[1 1 2 2 3 3 4 4 4 5 7 7 12 12 14 19 19 19 19 6 9 20 21 21 22 11 11 24]; 
EndingNodesOfConnection=[2 3 4 5 6 7 12 14 13 19 20 21 13 14 13 15 16 17 18 9 10 8 11 22 23 24 26 25]; 
XCoordinatesOfNodes=[500 400 600 300 500 600 700 900 600 600 700 200 400 300 400 600 400 600 500 800 700 800 900 800 900 700]; 
YCoordinatesOfNodes=[900 800 800 700 700 700 700 700 600 500 400 600 600 500 400 400 200 200 300 700 600 600 600 400 400 300]; 
[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,StartingNodesOfConnection,EndingNodesOfConnection,XCoordinatesOfNodes,YCoordinatesOfNodes)
WindowIndex=1;
[Graphparameters] = NL_G_ShowGraph(TopologyGraph,WindowIndex);
xtitle("Hybrid Topology (All Nodes & Edges)","X-Nodes","Y-Nodes");

NodeColor=30;
BorderThickness=10;
NodeDiameter=25;
WindowIndex=2;
ListOfNodes=[1 2 4 6 8 10 12 14];
[graph1,nodes]=NL_G_HighlightNodes(TopologyGraph,ListOfNodes,NodeColor,BorderThickness,NodeDiameter,WindowIndex);
xtitle("Highlighted nodes ","X-Nodes","Y-Nodes");

NodeColor=5;
EdgeWidth=5;
WindowIndex=3;
ListOfEdges=[1 5 7];
[graph2,nodes]=NL_G_HighlightEdges(TopologyGraph,ListOfEdges,NodeColor,EdgeWidth,WindowIndex);
xtitle("Highlighted  edges ","X-Nodes","Y-Nodes");

WindowIndex=4;
[GraphVisualise] = NL_G_ShowGraphNE(TopologyGraph,WindowIndex);
xtitle("Graph along with indices for Nodes and Edges","X-Nodes","Y-Nodes");

[ExtractedNode,ExtractedEdge]=NL_G_GraphSize(TopologyGraph);
disp('Number of nodes:',ExtractedNode);
disp('Number of edges:',ExtractedEdge);

// d. Print the number of edges every node has and node with maximum edges

NodeDegree = zeros(1, NumberOfNodes); // stores number of edges per node

for i = 1:NumberOfNodes
    EdgeList = NL_G_EdgesOfNode(TopologyGraph, i); 
    NodeDegree(i) = length(EdgeList);              
    disp("Node "+string(i)+" has "+string(NodeDegree(i))+" edges");
end

// Find node with maximum edges
[maxEdges, maxNode] = max(NodeDegree);

disp("Node with maximum edges: Node "+string(maxNode));
disp("Maximum number of edges: "+string(maxEdges));

StartingNode=4;
EndingNode=5;
[GetEdgeIndex]=NL_G_Nodes2Edge(TopologyGraph,StartingNode,EndingNode);
disp('Index of Edge across nodes 4 and 5:',GetEdgeIndex);

[EdgeLength]=NL_G_EdgesLength(TopologyGraph.node_x,TopologyGraph.node_y,TopologyGraph.head,TopologyGraph.tail);
disp('length of all edges',EdgeLength);

NodeIndex=2;
[GetEdgeIndex]=NL_G_EdgesOfNode(TopologyGraph,NodeIndex);
disp('Internal Edges of node 2:',GetEdgeIndex);

[node_x,node_y,node_border,node_diameter,node_color,node_number]=NL_G_NodeDataFields(TopologyGraph);
disp('Node x :',XCoordinatesOfNodes);
disp('Node y :', YCoordinatesOfNodes);
disp('Node Borders :', node_border);
disp('Node Diameter :', node_diameter);
disp('Node Colour :', node_color);
disp('Node Number :', node_number);

[e_head,e_tail,e_color,e_width,e_length,e_weight,e_number]=NL_G_EdgeDataFields(TopologyGraph)
disp('Head Nodes',e_head);
disp('Tail Nodes',e_tail);
disp('Edge Colours',e_color);
disp('Edge Widths',e_width);
disp('Edge Lengths',e_length);
disp('Edge Weights',e_weight);
disp('Edge Numbers',e_number);
