(define (domain triangle)

(:requirements :strips :typing :negative-preconditions :fluents :equality)

(:types segment point)

(:predicates
    (begin_with ?s - segment ?p - point)
    (end_with ?s - segment ?p - point)
    (isSegment ?s - segment ?p1 ?p2 - point)
    (isArc ?p - point ?s - segment)
    (isPoint ?p - point)
)

(:action draw_base
    :parameters (?s - segment
                 ?p1 ?p2 - point)
    :precondition (and
        (begin_with ?s ?p1)
        (end_with ?s ?p2)
        (not (isPoint ?p1))
        (not (isPoint ?p2))
    )
    :effect (and
        (isPoint ?p1)
        (isPoint ?p2)
        (isSegment ?s ?p1 ?p2)
    )
)

(:action draw_arc
    :parameters (?p1 - point
                 ?s1 - segment)
    :precondition (and
        (isPoint ?p1)
    )
    :effect (and
        (isArc ?p1 ?s1)
    )
)

; (:action intersect_arc
;     :parameters (?p1 ?p2 - points
;                  ?a1 ?a2 - arcs
;                  ?s1 ?s2 - segment)
;     :precondition (and
;         (isPoint ?p2)
;         (isArc ?a1)
;         (isSegment ?s2)
;     )
;     :effect (and
;         (isSegment ?s2)
;         (isArc1 ?a2)
;     )
; )

(:action make_2_arc_intersection
    :parameters (?p1 ?p2 ?p3 - point
                ?s1 ?s2 - segment)
    :precondition (and
        (not (= ?p1 ?p2))
        (not (= ?p1 ?p3))
        (not (= ?p2 ?p3))
        (not (= ?s1 ?s2))
        (isArc ?p1 ?s1)
        (isArc ?p2 ?s2)
        (and
            (or 
                (and 
                    (begin_with ?s1 ?p1)
                    (end_with ?s1 ?p3)
                )
                (and 
                    (begin_with ?s1 ?p3)
                    (end_with ?s1 ?p1)
                )
                
            )
            (or 
                (and 
                    (begin_with ?s2 ?p2)
                    (end_with ?s2 ?p3)
                )
                (and 
                    (begin_with ?s2 ?p3)
                    (end_with ?s2 ?p2)
                )
                
            )
        )
    )
    :effect (and
        (isPoint ?p3)
    )
)

(:action join_points
    :parameters (?p1 ?p2 - point
                ?s1 - segment)
    :precondition (and
        (not (= ?p1 ?p2))
        (isPoint ?p1)
        (isPoint ?p2)
        (or
            (and 
                (begin_with ?s1 ?p2)
                (end_with ?s1 ?p1)
            )
            (and 
                (begin_with ?s1 ?p1)
                (end_with ?s1 ?p2)
            )
        )
    )
    :effect (and
        (isSegment ?s1 ?p1 ?p2)
    )
)
)