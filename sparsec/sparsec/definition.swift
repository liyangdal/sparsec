//
//  utils.swift
//  sparsec
//
//  Created by Mars Liu on 15/3/10.
//  Copyright (c) 2015年 Dwarf Artisan. All rights reserved.
//

import Foundation

struct Equal<T> {
    typealias Pred = (T)->Bool
    typealias Curry = (T)->(T)->Bool
}

struct CPS<P, Q, S:CollectionType> {
    typealias Parser = Parsec<P, S>.Parser
    typealias ParserMP = Parsec<P, S>.Parser
    typealias Passing = Parsec<Q, S>.Parser
    typealias PassingMP = Parsec<[Q?], S>.Parser
    typealias Continuation = (P?)->Parsec<Q, S>.Parser
    typealias ContinuationMP = ([P?]?)->Parsec<Q, S>.Parser
    typealias Bind = (Parser, Continuation)->Passing
    typealias Bind_ = (Parser, Passing)->Passing
    typealias BindMP = (ParserMP, ContinuationMP)->PassingMP
    typealias BindMP_ = (ParserMP, PassingMP)->PassingMP
}

func unbox<T>(box:[T?], force:Bool=false)->[T] {
    var re:[T] = []
    if force {
        for e in box {
            re.append(e!)
        }
    } else {
        for e in box {
            if e != nil {
                re.append(e!)
            }
        }
    }
    return re
}

extension String: CollectionType {}

extension String.UnicodeScalarView:CollectionType{}

