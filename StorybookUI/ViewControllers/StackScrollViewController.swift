//
// Copyright (c) 2020 Eureka, Inc.
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

import Foundation

import StorybookKit

class StackScrollViewController : CodeBasedViewController {
  
  private let stackScrollView = StackScrollView()
  
  override init() {
    super.init()
  }

  func setViews(_ views: [UIView]) {
    stackScrollView.append(views: views)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if #available(iOS 13.0, *) {
      view.backgroundColor = .systemBackground
    } else {
      view.backgroundColor = .white
    }
    
    view.addSubview(stackScrollView)
    stackScrollView.frame = view.bounds
    stackScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
  }
  
}

extension StackScrollViewController {
  
  convenience init(descriptor: StorybookItemDescriptor) {
    self.init()
    setViews([
      {
        let view = HeaderStackCell()
        view.set(title: descriptor.title)
        view.set(detail: descriptor.detail)
        return view
      }(),
      ] + descriptor.makeCells())
  }
}
