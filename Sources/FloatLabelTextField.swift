//  FloatLabelRow.swift
//  Eureka ( https://github.com/xmartlabs/Eureka )
//
//  Copyright (c) 2016 Xmartlabs SRL ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

@IBDesignable public class FloatLabelTextField: UITextField {
    
    let animationDuration = 0.3
    var title = UILabel()
    
    // MARK:- Properties
    override public var accessibilityLabel:String! {
        get {
            if text?.isEmpty ?? true {
                return title.text
            } else {
                return text
            }
        }
        set {
            self.accessibilityLabel = newValue
        }
    }
    
    override public var placeholder:String? {
        didSet {
            title.text = placeholder
            title.sizeToFit()
        }
    }
    
    override public var attributedPlaceholder:NSAttributedString? {
        didSet {
            title.text = attributedPlaceholder?.string
            title.sizeToFit()
        }
    }
    
    public var titleFont: UIFont = .systemFont(ofSize: 12.0) {
        didSet {
            title.font = titleFont
            title.sizeToFit()
        }
    }
    
    @IBInspectable public var hintYPadding:CGFloat = 0.0
    
    @IBInspectable public var titleYPadding:CGFloat = 0.0 {
        didSet {
            var r = title.frame
            r.origin.y = titleYPadding
            title.frame = r
        }
    }
    
    @IBInspectable public var titleTextColor:UIColor = .gray {
        didSet {
            if !isFirstResponder {
                title.textColor = titleTextColor
            }
        }
    }
    
    @IBInspectable public var titleActiveTextColor:UIColor! {
        didSet {
            if isFirstResponder {
                title.textColor = titleActiveTextColor
            }
        }
    }
    
    // MARK:- Init
    required public init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    // MARK:- Overrides
    override public func layoutSubviews() {
        super.layoutSubviews()
        setTitlePositionForTextAlignment()
        let isResp = isFirstResponder
        if isResp && !(text?.isEmpty ?? true) {
            title.textColor = titleActiveTextColor
        } else {
            title.textColor = titleTextColor
        }
        // Should we show or hide the title label?
        if text?.isEmpty ?? true {
            // Hide
            hideTitle(isResp)
        } else {
            // Show
            showTitle(isResp)
        }
    }
    
    override public func textRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.textRect(forBounds: bounds)
        if !(text?.isEmpty ?? true){
            var top = ceil(title.font.lineHeight + hintYPadding)
            top = min(top, maxTopInset())
            r = r.inset(by: UIEdgeInsets(top: top, left: 0.0, bottom: 0.0, right: 0.0))
        }
        return r.integral
    }
    
    override public func editingRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.editingRect(forBounds: bounds)
        if !(text?.isEmpty ?? true) {
            var top = ceil(title.font.lineHeight + hintYPadding)
            top = min(top, maxTopInset())
            r = r.inset(by: UIEdgeInsets(top: top, left: 0.0, bottom: 0.0, right: 0.0))
        }
        return r.integral
    }
    
    override public func clearButtonRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.clearButtonRect(forBounds: bounds)
        if !(text?.isEmpty ?? true) {
            var top = ceil(title.font.lineHeight + hintYPadding)
            top = min(top, maxTopInset())
            r = CGRect(x:r.origin.x, y:r.origin.y + (top * 0.5), width:r.size.width, height:r.size.height)
        }
        return r.integral
    }
    
    // MARK:- Private Methods
    private func setup() {
        borderStyle = UITextField.BorderStyle.none
        titleActiveTextColor = tintColor
        // Set up title label
        title.alpha = 0.0
        title.font = titleFont
        title.textColor = titleTextColor
        if let str = placeholder, !str.isEmpty {
            title.text = str
            title.sizeToFit()
        }
        self.addSubview(title)
    }
    
    private func maxTopInset()->CGFloat {
        return max(0, floor(bounds.size.height - (font?.lineHeight ?? 0) - 4.0))
    }
    
    private func setTitlePositionForTextAlignment() {
        let r = textRect(forBounds: bounds)
        var x = r.origin.x
        if textAlignment == .center {
            x = r.origin.x + (r.size.width * 0.5) - title.frame.size.width
        } else if textAlignment == .right {
            x = r.origin.x + r.size.width - title.frame.size.width
        }
        title.frame = CGRect(x:x, y:title.frame.origin.y, width:title.frame.size.width, height:title.frame.size.height)
    }
    
    private func showTitle(_ animated:Bool) {
        let dur = animated ? animationDuration : 0
        UIView.animate(withDuration: dur, delay:0, options: UIView.AnimationOptions.beginFromCurrentState.union(.curveEaseOut), animations:{
            // Animation
            self.title.alpha = 1.0
            var r = self.title.frame
            r.origin.y = self.titleYPadding
            self.title.frame = r
        })
    }
    
    private func hideTitle(_ animated:Bool) {
        let dur = animated ? animationDuration : 0
        UIView.animate(withDuration: dur, delay:0, options: UIView.AnimationOptions.beginFromCurrentState.union(.curveEaseIn), animations:{
            // Animation
            self.title.alpha = 0.0
            var r = self.title.frame
            r.origin.y = self.title.font.lineHeight + self.hintYPadding
            self.title.frame = r
        })
    }
    
}
