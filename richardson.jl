function richextr(F, h0, q, p, tol)
    m = length(p)
    R = zeros(m+2, m+1)
    info = [Inf, 0, 0]  # best so far
    h = h0
    R[1, 1] = F(h)
    
    for i = 1:m+1
        h = h / q
        R[i+1, 1] = F(h)
        
        for k = 1:min(i, m)
            d = R[i+1, k] - R[i, k]
            
            if abs(d) <= tol  # desired accuracy obtained
                y = R[i+1, k]
                info = [abs(d), i+1, k]
                if nargout > 2  # return active part of R
                    R = R[1:i+1, 1:i]
                end
                return y, info, R
            end
            
            if abs(d) < info[1]  # update best so far
                info = [abs(d), i+1, k]
            end
            
            R[i+1, k+1] = R[i+1, k] + d / (q^p[k] - 1)  # extrapolate
        end
    end
    
    # Required accuracy not obtained. Return best estimate
    y = R[info[2], info[3]]
    return y, info, R
end

function forwarddiff(f, x, h)
    return (f(x+h) - f(x)) / h
end

function backwarddiff(f, x, h)
    return (f(x) - f(x-h)) / h
end

function centraldiff(f, x, h)
    return (f(x+h) - f(x-h)) / (2*h)
end
