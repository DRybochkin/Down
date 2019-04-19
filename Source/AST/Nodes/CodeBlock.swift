//
//  CodeBlock.swift
//  Down
//
//  Created by John Nguyen on 09.04.19.
//

import Foundation
import libcmark

public class CodeBlock: Node {
    
    public var cmarkNode: CMarkNode
    
    public var debugDescription: String {
        return "Code Block - \(literal ?? "nil"), fenceInfo: \(fenceInfo ?? "nil")"
    }
    
    /// The code content, if present.
    public lazy var literal: String? = cmarkNode.literal
    
    /// The fence info is an optional string that trails the opening sequence of backticks.
    /// It can be used to provide some contextual information about the block, such as
    /// the name of a programming language.
    ///
    /// For example:
    /// ```
    /// '''<fence info>
    /// <literal>
    /// '''
    /// ```
    ///
    public lazy var fenceInfo: String? = cmarkNode.fenceInfo
    
    /// Attempts to wrap the given `CMarkNode`.
    ///
    /// This will fail if `cmark_node_get_type(cmarkNode) != CMARK_NOD_CODE_BLOCK`
    ///
    public init?(cmarkNode: CMarkNode) {
        guard cmarkNode.type == CMARK_NODE_CODE_BLOCK else { return nil }
        self.cmarkNode = cmarkNode
    }
}
