% Sudoku solver
%
% variables: each a cell of the sudoku board
% domain: numbers 1-9
% constraints: the sudoku game

:- use_module(library(clpfd)).

sudoku(Cells) :-
	% These are our variables
	Cells = [A1, A2, A3, A4, A5, A6, A7, A8, A9,
	         B1, B2, B3, B4, B5, B6, B7, B8, B9,
	         C1, C2, C3, C4, C5, C6, C7, C8, C9,
	         D1, D2, D3, D4, D5, D6, D7, D8, D9,
	         E1, E2, E3, E4, E5, E6, E7, E8, E9,
	         F1, F2, F3, F4, F5, F6, F7, F8, F9,
	         G1, G2, G3, G4, G5, G6, G7, G8, G9,
	         H1, H2, H3, H4, H5, H6, H7, H8, H9,
	         I1, I2, I3, I4, I5, I6, I7, I8, I9],

	% And now our domain
	Cells ins 1..9,
	
	 % What do we know of our game?
	 % This is the one in the spreadsheet
	 %  Top cells:
	 	A1 in 8, A2 in 7, A3 in 3,
	 		 B2 in 6, B3 in 5,
	 	         C2 in 2,
	
	 	A4 in 4, A5 in 1,
	 	         B5 in 2, B6 in 8,
	 	C4 in 7,          C6 in 3,
	
	 	A7 in 9,
	 	         B8 in 7,
	
	 %%	%  Middle cells:
	 	D1 in 5, D2 in 4,
	 	E1 in 2,          E3 in 8,
	 	F1 in 6, F2 in 9,
	
	 	                  E6 in 7,
	 	         F5 in 8,
	
	 	D7 in 2, D8 in 1,
	 	E7 in 4, E8 in 9,
	
	 %	%  Bottom cells
	 	G1 in 4, G2 in 8,
	 			H1 in 7,
	 	        I2 in 1,
	       
	 	          H5 in 3, H6 in 1,
	 		           I6 in 9,
	
	 	G7 in 5,
	 	H7 in 6,          H9 in 9,
	 	I7 in 8,          I9 in 7,

	

	%%
	% Constraints
	%  Boxes
	all_different([A1, A2, A3,
	              B1, B2, B3,
		      C1, C2, C3]),
	all_different([A4, A5, A6,
	              B4, B5, B6,
		      C4, C5, C6]),
	all_different([A7, A8, A9,
		      B7, B8, B9,
		      C7, C8, C9]),

	all_different([D1, D2, D3,
	              E1, E2, E3,
		      F1, F2, F3]),
	all_different([D4, D5, D6,
	              E4, E5, E6,
		      F4, F5, F6]),
	all_different([D7, D8, D9,
		      E7, E8, E9,
		      F7, F8, F9]),

	all_different([G1, G2, G3,
	              H1, H2, H3,
		      I1, I2, I3]),
	all_different([G4, G5, G6,
	              H4, H5, H6,
		      I4, I5, I6]),
	all_different([G7, G8, G9,
		      H7, H8, H9,
		      I7, I8, I9]),

	 % Boxes must total 45	      
	 A1 + A2 + A3 + B1 + B2 + B3 + C1 + C2 + C3 #= 45,
	 A4 + A5 + A6 + B4 + B5 + B6 + C4 + C5 + C6 #= 45,
	 A7 + A8 + A9 + B7 + B8 + B9 + C7 + C8 + C9 #= 45,

	 D1 + D2 + D3 + E1 + E2 + E3 + F1 + F2 + F3 #= 45,
	 D4 + D5 + D6 + E4 + E5 + E6 + F4 + F5 + F6 #= 45,
	 D7 + D8 + D9 + E7 + E8 + E9 + F7 + F8 + F9 #= 45,

	 G1 + G2 + G3 + H1 + H2 + H3 + I1 + I2 + I3 #= 45,
	 G4 + G5 + G6 + H4 + H5 + H6 + I4 + I5 + I6 #= 45,
	 G7 + G8 + G9 + H7 + H8 + H9 + I7 + I8 + I9 #= 45,

	 % Columns must be all different values
	 all_different([A1, B1, C1, D1, E1, F1, G1, H1, I1]),
	 all_different([A2, B2, C2, D2, E2, F2, G2, H2, I2]),
	 all_different([A3, B3, C3, D3, E3, F3, G3, H3, I3]),
	 all_different([A4, B4, C4, D4, E4, F4, G4, H4, I4]),
	 all_different([A5, B5, C5, D5, E5, F5, G5, H5, I5]),
	 all_different([A6, B6, C6, D6, E6, F6, G6, H6, I6]),
	 all_different([A7, B7, C7, D7, E7, F7, G7, H7, I7]),
	 all_different([A8, B8, C8, D8, E8, F8, G8, H8, I8]),
	 all_different([A9, B9, C9, D9, E9, F9, G9, H9, I9]),

	 % Columns must total 45
	 A1 + B1 + C1 + D1 + E1 + F1 + G1 + H1 + I1 #= 45,
	 A2 + B2 + C2 + D2 + E2 + F2 + G2 + H2 + I2 #= 45,
	 A3 + B3 + C3 + D3 + E3 + F3 + G3 + H3 + I3 #= 45,
	 A4 + B4 + C4 + D4 + E4 + F4 + G4 + H4 + I4 #= 45,
	 A5 + B5 + C5 + D5 + E5 + F5 + G5 + H5 + I5 #= 45,
	 A6 + B6 + C6 + D6 + E6 + F6 + G6 + H6 + I6 #= 45,
	 A7 + B7 + C7 + D7 + E7 + F7 + G7 + H7 + I7 #= 45,
	 A8 + B8 + C8 + D8 + E8 + F8 + G8 + H8 + I8 #= 45,
	 A9 + B9 + C9 + D9 + E9 + F9 + G9 + H9 + I9 #= 45,

	 % Rows must be all different values
	 all_different([A1, A2, A3, A4, A5, A6, A7, A8, A9]),
	 all_different([B1, B2, B3, B4, B5, B6, B7, B8, B9]),
	 all_different([C1, C2, C3, C4, C5, C6, C7, C8, C9]),
	 all_different([D1, D2, D3, D4, D5, D6, D7, D8, D9]),
	 all_different([E1, E2, E3, E4, E5, E6, E7, E8, E9]),
	 all_different([F1, F2, F3, F4, F5, F6, F7, F8, F9]),
	 all_different([G1, G2, G3, G4, G5, G6, G7, G8, G9]),
	 all_different([H1, H2, H3, H4, H5, H6, H7, H8, H9]),
	 all_different([I1, I2, I3, I4, I5, I6, I7, I8, I9]),

	 % Rows must total 45
	 A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9 #= 45,
	 B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8 + B9 #= 45,
	 C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 #= 45,
	 D1 + D2 + D3 + D4 + D5 + D6 + D7 + D8 + D9 #= 45,
	 E1 + E2 + E3 + E4 + E5 + E6 + E7 + E8 + E9 #= 45,
	 F1 + F2 + F3 + F4 + F5 + F6 + F7 + F8 + F9 #= 45,
	 G1 + G2 + G3 + G4 + G5 + G6 + G7 + G8 + G9 #= 45,
	 H1 + H2 + H3 + H4 + H5 + H6 + H7 + H8 + H9 #= 45,
	 I1 + I2 + I3 + I4 + I5 + I6 + I7 + I8 + I9 #= 45,

	labeling([], Cells).

% Example query
%
% sudoku([A1, A2, A3, A4, A5, A6, A7, A8, A9, B1, B2, B3, B4, B5, B6, B7, B8, B9, C1, C2, C3, C4, C5, C6, C7, C8, C9, D1, D2, D3, D4, D5, D6, D7, D8, D9, E1, E2, E3, E4, E5, E6, E7, E8, E9, F1, F2, F3, F4, F5, F6, F7, F8, F9, G1, G2, G3, G4, G5, G6, G7, G8, G9, H1, H2, H3, H4, H5, H6, H7, H8, H9, I1, I2, I3, I4, I5, I6, I7, I8, I9]). 

