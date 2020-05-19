Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F21D9474
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 12:37:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jazch-00065m-Nx
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 10:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jazcd-00064t-8j
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 10:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i9H4OZ10YdHZdhc7/rIrHtv9xR5CbfD8gzRd+3adHCg=; b=frFbH9oNnvVQw4jIPirekkK58p
 hwGa78rTVLzuDDGzTQO/L2WGgrpySqwOHpQEcFlN0hY0sLwaCvOrZPoeNpqNlToTlfMQx5pCeY6gC
 e1hCvWMQx1KADrXSvZ2Gc6kU8lCQtCV+cDSp8VnzXQSojSxwNhy9StGBH2Ri+ITwRGBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i9H4OZ10YdHZdhc7/rIrHtv9xR5CbfD8gzRd+3adHCg=; b=MLLzUKXX2J9efQU5Y2nSYcaASf
 9rmRmF0QOVSEGzfPRCWS+JodPPBdjoebslD989A+Ce6qCeXGJnRid3Tz/PjPzqCNK4XDl/pIWxGuz
 HJVGRwtxyjDQa0a2Ouyz/5dof3zYqldobF71MPHT5qqlYTY5QqjsHvlzP5MPFT8qIvI0=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jazcY-00F8n4-IG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 10:37:19 +0000
Received: by mail-wr1-f65.google.com with SMTP id 50so15258444wrc.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i9H4OZ10YdHZdhc7/rIrHtv9xR5CbfD8gzRd+3adHCg=;
 b=XWeV8b7S4EVjZhJ79Ag3v5DEaPyKNzfmliI3RiiRpgwEJDw+Ncgl4tXOIDiPBN0ehm
 YWZkEFKgex9Pc/rKjydVwahDLrwR8y6N2K4ijHy3Amx1ZdXZ2xBQgWhfRQABcJPNiNen
 rvvr6M54m9ca8L0/CiltsnZCDTQWxVvjmvFJbUT1tWQqdCluvrPTvoiST9aq4ly+lBdO
 9EODHL0fC3KzWE7uHm51t4l8qTtDotOQL7iYLRSY1R7UA8NmexCH9vCLfXBsdeMPYMvj
 3T+qCgXK3atV0sLi8FiY4uh4nBrb+rXL92/CWmN5vPGLifpAvQMdAg7EhyCp2P4iaesc
 Ek2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i9H4OZ10YdHZdhc7/rIrHtv9xR5CbfD8gzRd+3adHCg=;
 b=SOW5UMOgb88PzJwWUDTCxBoDznr7hGx33lwk2OCbJXjBUcWYnzmpXBWK9yFNmOUvFk
 tk3c+mZBzfKeVoAmTpNQq3oYVvvOIDmqbwQAl+zcbIJ4l7KlawO5aHMzvsEiiFC9yJio
 mOYY87B1X2RY5j8kF6O+cAhG/Lb1IgvqE34u+sm62mKFa0MvrFn/7UckUeZMpLKQgAY/
 3bPRoPr6CMT5oLBtAY3vn69yxmpf5JCai2nb4D/bJ8ERFwJePIrqxgizwdIEhAdlOt6V
 lrBlVKeGp9Z9aALFJ0IOjLa1LB7E1akM8hS7jKzo71+C9L/sB9qiIiDQq4LfhpMb+hQD
 f9QQ==
X-Gm-Message-State: AOAM532qwtpm2s32lN+cEPh187ttbft2ek2iUvHuRuezhrbRGKwhXZZL
 DFp/EufjFsX+w3t6DGCRmk3pZQ==
X-Google-Smtp-Source: ABdhPJzJiTwMyvVTnOctSw0HxZdkufYRwI8zQqI86F0CX4btXGOdMQMwWIBlYi+xtP8+zww/fzO92g==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr24784938wru.407.1589884621033; 
 Tue, 19 May 2020 03:37:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l18sm3275536wmj.22.2020.05.19.03.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:37:00 -0700 (PDT)
Date: Tue, 19 May 2020 11:36:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200519103658.eha5zbmun4i56oml@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jazcY-00F8n4-IG
Subject: Re: [Kgdb-bugreport] [PATCH v4 00/12] kgdb: Support late serial
 drivers; enable early debug w/ boot consoles
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 catalin.marinas@arm.com, bjorn.andersson@linaro.org, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, will@kernel.org,
 corbet@lwn.net, x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, jinho lim <jordan.lim@samsung.com>,
 agross@kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org,
 jslaby@suse.com, Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 tglx@linutronix.de, mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, jason.wessel@windriver.com,
 Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 01:08:38PM -0700, Douglas Anderson wrote:
> This whole pile of patches was motivated by me trying to get kgdb to
> work properly on a platform where my serial driver ended up being hit
> by the -EPROBE_DEFER virus (it wasn't practicing social distancing
> from other drivers).  Specifically my serial driver's parent device
> depended on a resource that wasn't available when its probe was first
> called.  It returned -EPROBE_DEFER which meant that when "kgdboc"
> tried to run its setup the serial driver wasn't there.  Unfortunately
> "kgdboc" never tried again, so that meant that kgdb was disabled until
> I manually enalbed it via sysfs.
> 
> <snip>
> 
> This series (and my comments / documentation / commit messages) are
> now long enough that my eyes glaze over when I try to read it all over
> to double-check.  I've nontheless tried to double-check it, but I'm
> pretty sure I did something stupid.  Thank you ahead of time for
> pointing it out to me so I can fix it in v5.  If somehow I managed to
> not do anything stupid (really?) then thank you for double-checking me
> anyway.

Applied (minus the arm64 specific stuff), should be in the next linux-next.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
