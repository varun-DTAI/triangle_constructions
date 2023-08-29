; Hello World example problem

(define (problem construct)

(:domain triangle)

(:objects
    a b c - point
    s1 s2 s3 - segment
)

(:init
    
    (begin_with s1 a)
    (end_with s1 b)
    
    (begin_with s2 b)
    (end_with s2 c)
    
    (begin_with s3 c)
    (end_with s3 a)
)

(:goal
    (and
        (isSegment s1 a b)
        (isSegment s2 b c)
        (isSegment s3 c a)
    )
)
)