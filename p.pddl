(define (problem problem-1)
    (:domain my_domain)
    (:requirements :strips :typing)
    (:objects a_ab a_ac a_bc p_a p_b p_c s_ab s_ac s_bc - type_1)
    (:init (isSegment s_ab) (not (isPoint p_a)) (not (isPoint p_b)))
    (:goal (and (isSegment s_ab) (isPoint p_a) (isPoint p_b)))
)