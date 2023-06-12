function pathLengths = calculatePathLengths(weightMatrix)
    n = size(weightMatrix, 1); % Number of nodes
    pathLengths = zeros(n); % Initialize path lengths matrix
    
    for source = 1:n
        dist = Inf(1, n); % Initialize distances to infinity
        dist(source) = 0; % Distance from source to itself is zero
        visited = false(1, n); % Track visited nodes
        
        for i = 1:n
            % Find the node with the minimum distance that has not been visited
            [~, current] = min(dist(~visited));
            visited(current) = true;
            
            % Check the neighbors of the current node
            for neighbor = 1:n
                if weightMatrix(current, neighbor) > 0 % Non-zero weight indicates a connection
                    % Calculate the potential new distance to the neighbor
                    newDist = dist(current) + weightMatrix(current, neighbor);
                    
                    % Update the distance if the new distance is shorter
                    if newDist < dist(neighbor)
                        dist(neighbor) = newDist;
                    end
                end
            end
        end
        
        pathLengths(source, :) = dist;
    end
end
