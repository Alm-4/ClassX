/*
 * Elevator Controller Module
 * 
 * Controls a simple state based elevator system with up to 8 floors (0-7)
 * Supports up to 3 concurrent floor requests  
 */
/*
 --- Notice from the future ---
 The "Request Button" code should be running on the same one clock as the rest of the code. 
 There shouldn't be any blocking assignment. Having 2 clocks here is not good.
 */


module elevator (
    input        i_clk,
    input        i_rst,
    input        i_button_pressed,
    input  [2:0] i_button_value,
    
    output reg [2:0] o_floor
);

    reg [1:0] state = 0;            // Current state
    reg [1:0] num_floors_left = 0;  // Number of pending floor requests
    reg [2:0] request_queue [2:0];  // Storage for up to 3 floor values
    
    // State definitions
    parameter IDLE = 2'b00;
    parameter UP = 2'b01;
    parameter DOWN = 2'b10; 

    
    // Main sequential logic
    always @(posedge i_clk or posedge i_rst) begin // (Non-blocking assignment)
        if (i_rst == 1) begin 
            // Initial conditions
            state <= IDLE;
            o_floor <= 0;
            num_floors_left <= 0;
            request_queue[0] <= 0;
            request_queue[1] <= 0;
            request_queue[2] <= 0;
        end 
        else begin 
            case (state)
            IDLE: begin 
                // Move to another state if there are floor requests
                if (num_floors_left != 0) begin
                    if (request_queue[0] > o_floor) state <= UP;
                    else if (request_queue[0] < o_floor) state <= DOWN;
                end
            end
            
            UP: begin 
                o_floor <= o_floor + 1; // Move one floor up
               
                // When the requested floor is reached: remove a request and shift to the next request 
                if (o_floor == (request_queue[0] - 1)) begin // Checking the previous value
                    num_floors_left <= num_floors_left - 1; // Remove a request
                    // Shift the queue
                    request_queue[0] <= request_queue[1];
                    request_queue[1] <= request_queue[2]; 
                    
                    // Move to another state if there are more floor requests 
                    if (num_floors_left != 1) begin
                        // Going to the up or down state (checking previous values)
                        if (request_queue[1] > o_floor) state <= UP; 
                        else if (request_queue[1] < o_floor) state <= DOWN;
                    end
                    else state <= IDLE;
                end
            end
            
            DOWN: begin 
                o_floor <= o_floor - 1; // Move one floor down
                
                // When the requested floor is reached: remove a request and shift to the next request 
                if (o_floor == (request_queue[0] + 1)) begin // Checking the previous value
                    num_floors_left <= num_floors_left - 1; // Remove a request
                    // Shift the queue
                    request_queue[0] <= request_queue[1];
                    request_queue[1] <= request_queue[2];
                    
                    // Move to another state if there are more floor requests 
                    if (num_floors_left != 1) begin 
                        // Going to the up or down state (checking previous values)
                        if (request_queue[1] > o_floor) state <= UP;
                        else if (request_queue[1] < o_floor) state <= DOWN;
                    end
                    else state <= IDLE;
                end
            end
        endcase  
        end 
    end
    
    
    // Request button
    always @(posedge i_button_pressed) begin  // (Blocking assignment)
        if (i_rst == 1) begin 
            // Initial conditions
            state = IDLE;
            o_floor = 0;
            num_floors_left = 0;
            request_queue[0] = 0;
            request_queue[1] = 0;
            request_queue[2] = 0;
        end
        else begin  
            num_floors_left = num_floors_left + 1; // Adding a request
            if (state == IDLE) begin 
                request_queue[0] = i_button_value;
                request_queue[1] = 0; 
                request_queue[2] = 0; 
            end 
            else begin // State is currently up or down
                // Storing a future request
                request_queue[num_floors_left - 1] = i_button_value; 
            end
        end
    end
endmodule

