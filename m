Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B831DEBD9
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 17:30:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc9dF-0003V2-98
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 15:30:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jc9dD-0003Uo-P2
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 15:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGeQM1dfUNV6yQ38TOhnl5g6+/IaVOCSaD7SXsj2Qr0=; b=kPDZyOPCHbTz/1Fha5wd9TYPoE
 siJRZYylz/l2FOPRFFmlYLqTQ5TwkW0oSbMAFcgOsnutGi3F9bNp1gRkhtxjv48O5vF66+f73RqAP
 0s8uZVqDIYUGhT14KoCKbRHbV33aHT5eCU6Z5e8xXL5MKqNEEu0ZdGvtWvBwbaqLPdCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pGeQM1dfUNV6yQ38TOhnl5g6+/IaVOCSaD7SXsj2Qr0=; b=SQuKdSVSvXJCnnGFnsoDh9g0XA
 k/ZxO4dkJDhOL+/BK0i6S1XzTJbqPypXVUrbkK4hc+r9MB/J9NgzRh2PXX0iw9ySuhv1XexblJb56
 ekkR9IpeLzXW39766Jfiyz10aJhbDi9DGrGc4vJnMTdmK24eqvgXkUyVsDp+XZcth2To=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc9dA-00D2Vr-2W
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 15:30:43 +0000
Received: by mail-wr1-f67.google.com with SMTP id e1so10560497wrt.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pGeQM1dfUNV6yQ38TOhnl5g6+/IaVOCSaD7SXsj2Qr0=;
 b=mg2kS9Pu1T9ifwA0mpe05G6x1t3Ppsu6Qa9bXzWW2e6DFx59fezJbsW2NF+OXfSVuC
 Blu/dzlOcOswC+7Iw8mDznR1oinY/l1z2OI2khb6hZvq4I4YmdUZP2CPUwqDsEaufnyR
 TMzgi4MvNkrvCwbWY/UagHowidZFgkx+JT8N2ubypvj/d/NlXd13PO3c1cDmOKeyYF2X
 VCsLocQmET+wvTcAc8fK1tjVUi9HlV+FVExJyheWj/mr1qZ4snmmJHrtj30zfcoHYnEL
 VA3V+lp2ZccpcgXMGRm9gcGo7HEEJkJIKsWnOz0OZYCegnBIdfRlOXwkScDCaclM3+To
 YvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pGeQM1dfUNV6yQ38TOhnl5g6+/IaVOCSaD7SXsj2Qr0=;
 b=pCtfb6LbcVs4lpST6ZEFSKqwdwy+z3x+9edchbst3m/Iu16rbvhV1HAOyNHaYpE/2i
 70lURUSmMuUdPl+yUpgIbN+8Jgvlo52F+Y4MmpM7x2+GZlwoCuq5Lp4Arvo0VoCZgAXL
 cr+M+wRNBnBcJQdVfejMeqIkWCbTHNaABTQVCtFAXoRQBkAA6h4ec+UHrW5cQFFv/xKv
 P46ERu4IV4fg8WCcGhoMAu8BlOAz9+jyfBxzohikFa8Cu5cBZW2NwZmz/vYc0jCMf3cA
 SJWt9IpINsnQpjF5irbWahYDfXNu9dh52EeImeb3w84cPnXKLR2SNCgH1jYMAy1jx9Pu
 yx9w==
X-Gm-Message-State: AOAM532pz0T+oR1lx0V0oRCEQ6IJfzWy7x941xu/YW8tjE1g6/+UJfec
 YnOhMDQ4SwMVP6ttgDpbaPltNQ==
X-Google-Smtp-Source: ABdhPJykHFJmAf/i5dNkdymoFT6Eq28I067RserzsVvEDrvOVnCQI48w16BcpwS4ezASlB8WW50Iig==
X-Received: by 2002:adf:dc50:: with SMTP id m16mr3857267wrj.329.1590161433623; 
 Fri, 22 May 2020 08:30:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z132sm10873040wmc.29.2020.05.22.08.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 08:30:32 -0700 (PDT)
Date: Fri, 22 May 2020 16:30:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200522153031.2ydgx4k6jl7dsiqn@holly.lan>
References: <20200429170804.880720-1-daniel.thompson@linaro.org>
 <20200430161741.1832050-1-daniel.thompson@linaro.org>
 <CAD=FV=U64XLRFkTyTi1qDZjTYQKJ9WVBf3OoULpw6yncOQURTg@mail.gmail.com>
 <CAD=FV=Xut=5y-MyJSu+ERdMRkKbSf8SGMhUHg5OP=y8zA1N-xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xut=5y-MyJSu+ERdMRkKbSf8SGMhUHg5OP=y8zA1N-xQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc9dA-00D2Vr-2W
Subject: Re: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Allow earlycon
 initialization to be deferred
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
Cc: Patch Tracking <patches@linaro.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 10:18:10AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 30, 2020 at 9:47 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Apr 30, 2020 at 9:18 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > Currently there is no guarantee that an earlycon will be initialized
> > > before kgdboc tries to adopt it. Almost the opposite: on systems
> > > with ACPI then if earlycon has no arguments then it is guaranteed that
> > > earlycon will not be initialized.
> > >
> > > This patch mitigates the problem by giving kgdboc_earlycon a second
> > > chance during console_init(). This isn't quite as good as stopping during
> > > early parameter parsing but it is still early in the kernel boot.
> > >
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >
> > > Notes:
> > >     v2: Simplified, more robust, runs earlier, still has Doug's
> > >         recent patchset as a prerequisite. What's not to like?
> > >
> > >     More specifically, based on feedback from Doug Anderson, I
> > >     have replaced the initial hacky implementation with a console
> > >     initcall.
> > >
> > >     I also made it defer more aggressively after realizing that both
> > >     earlycon and kgdboc_earlycon are handled as early parameters
> > >     (meaning I think the current approach relies on the ordering
> > >     of drivers/tty/serial/Makefile to ensure the earlycon is enabled
> > >     before kgdboc tries to adopt it).
> > >
> > >     Finally, my apologies to Jason and kgdb ML folks, who are seeing
> > >     this patch for the first time. I copied the original circulation
> > >     list from a patch that wasn't kgdb related and forgot to update.
> > >
> > >  drivers/tty/serial/kgdboc.c | 41 +++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 39 insertions(+), 2 deletions(-)
> >
> > Thanks, this looks great!
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Are you planning to rebase this patch atop what landed?  It seems like
> a useful feature.  If you want me to give a shot a rebasing, let me
> know!

I've got it on it's way...


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
