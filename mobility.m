function[] = mobility(type, velocity_parameter, pause_time, dummy_locations)

  vp = velocity_parameter;
  pt = pause_time;
  dl = dummy_locations;
  pn = 4;
  
  if type == 0
    pn = pn+1;
    fprintf("Drone path for RWP:\n");
    x1 = randi([1, 1000]);
    y1 = randi([1,1000]);
    start_points = [x1,y1];

    x = zeros(pn, 1);
    y = zeros(pn, 1);
 
    x(2,1) = start_points(1);
    y(2,1) = start_points(2);

    for i = 3:pn
        x(i,1) = randi([1, 1000]);
        y(i,1) = randi([1, 1000]);
    end

    figure;
    plot(x,y);
    hold on;
    
    tic;
    point_pos = [x(1) y(1)];
    plot(point_pos(1), point_pos(2), 'r*', XData=1000, YData=1000); 
    time_step = 10;  
    
    total_distance = 0;  
     
    for i = 2:pn   
        dist = norm([x(i)-x(i-1) y(i)-y(i-1)]);
        total_distance = total_distance + dist;  
        
        time_needed = dist / vp;
        
        num_steps = ceil(time_needed / time_step);
         
        step_vector = [x(i)-x(i-1) y(i)-y(i-1)] / num_steps;
         
        for j = 1:num_steps    
            point_pos = point_pos + step_vector;
            
            plot(point_pos(1), point_pos(2), 'r*');
             
            pause(0.1);
        end
        pause(pt);    
    end
    toc
    fprintf('Total distance travelled: %f meter\n', total_distance);
 
    xlabel('X-axis');
    ylabel('Y-axis');

    title('A RWP mobility model of Drone');
  end

  if type == 1
    %pn = pn;
    dl = dl +1 ;
    fprintf("Drone path for PPR:\n");
    start_points = [0,0];
    travelled_total_path = 0;
    
    tic;
    count = 0;
    while count < pn
        x1 = randi([1, 1000]);
        y1 = randi([1, 1000]);
        end_points = [x1,y1];
    
        x = zeros(dl, 1);
        y = zeros(dl, 1);
           
        x(1,1) = start_points(1);
        y(1,1) = start_points(2);
        x(dl,1) = end_points(1);
        y(dl,1) = end_points(2);
        st_m = [start_points(1), end_points(1)];
        en_m = [start_points(2), end_points(2)];
        plot(st_m, en_m);
        hold on;
        x_dis = ceil(abs(x(dl,1)-x(1,1))/dl);
            
        for i = 2:dl-1
            x_high = (i-1)*(x_dis);
            
             if start_points(1) < end_points(1)
                h_val = x(i-1,1)+x_high;
                if h_val > end_points(1)
                    h_val = end_points(1);
                end
                x(i,1) = randi([x(i-1,1), h_val]);
             else
                h_val = x(i-1,1)-x_high;
                if h_val < end_points(1)
                    h_val = end_points(1);
                end 
                x(i,1) = randi([h_val ,x(i-1,1)]);
            end    
            if start_points(2) < end_points(2)
                y(i,1) = randi([start_points(2), end_points(2)]);
            else
                y(i,1) = randi([end_points(2),start_points(2)]);
            end
        end
        %figure;
        plot(x,y);
        hold on;
    
        point_pos = [x(1) y(1)];
        plot(point_pos(1), point_pos(2), '-ro', XData=1000, YData=1000);
         
        velocity = vp;  
        time_step = 30;  
        
        total_distance = 0;  
     
        for i = 2:dl   
            dist = norm([x(i)-x(i-1) y(i)-y(i-1)]);
            total_distance = total_distance + dist;  
            travelled_total_path = travelled_total_path+dist;

            time_needed = dist / velocity;
            
            num_steps = ceil(time_needed / time_step);
             
            step_vector = [x(i)-x(i-1) y(i)-y(i-1)] / num_steps;
             
            for j = 1:num_steps    
                point_pos = point_pos + step_vector;
                
                plot(point_pos(1), point_pos(2), '-ro');
                 
                pause(0.1);
            end
            pause(pt);
        end


        count = count +1;
        start_points = [x1,y1];
    end
    toc;
    fprintf('Total distance travelled: %f meter\n', travelled_total_path);
 
    xlabel('X-axis');
    ylabel('Y-axis');

    title('A PPR mobility model of Drone');
  end
end