Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2924295A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 12 Aug 2020 14:32:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5pvT-0004kG-4s
	for lists+kgdb-bugreport@lfdr.de; Wed, 12 Aug 2020 12:32:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <allen.lkml@gmail.com>) id 1k5pvR-0004jx-Hi
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 12:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=; b=f3+WR8RnHkP2rqBhpQgl8o3XY5
 Umb5O27bh4nnGYb4+ci1F9lFjvotUScRaSZwhY/ZXlE5TmnnhyP22h1FQ8plPUh+AFRcoJwySQgUE
 9+BhASPRI7BSSDXdrFaifsiWpnP6O5YXbPKHiMhrF6sKLrq7mc514UC2KLbncYh8RJAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=; b=Bmf1H4V8FBBshoQGgqFP6N6zxP
 h8MVCtChWV9WuQvlEKObnybKe0Bv8T8KclCSBzgPuklM7zNVes9SGVqEQqOKGq+ePqWx5DFXdoX5W
 tv0pQnFOLtehxlN5IspI+l2TW3clEZi8lWGlCrpOMxnMeWgCSvqfXk0Qv3IYiiqLUV38=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5pvQ-00AgnP-8K
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 12:32:13 +0000
Received: by mail-oi1-f194.google.com with SMTP id 25so1663262oir.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=;
 b=YkqGfxOvN96eGolDSvt0iCWOvbZZeKLlCAGi8BAH/XmoiSQNEa5synSoNNTH3X5sLJ
 J0XSC09qP/ds7a/R4Q0SSHomSPcp0o15AVV2+lMvLnTd0vBV6RrhGJjKX/x/0SkqiKwV
 0A06fOqNelj9etWPOTYb+YgdV2enu7Fu10STP5iSBmXYnoCAcjjN9WoirJjjmeTuYc3n
 nbzkPOmaEZpF2jhtGMP8FxV8952FOiOMh2n1AUuK375GNKqppbaAbdxZ1DWWt48ETdQL
 u7QVCoEWkBLGQ3/N4TpSYorKV9FXu36SK0GdrESPraE01ZXd8Fjq2XFQXHvDOrZrjyq5
 8LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=;
 b=dE0OfwPlp6dxTM8oJOamABb+NcfZn06m+OtSo2rNF0El8QtUWYjlKaaQ04pygWZZ4v
 pa68msQhLiSVE3VoN/bBcvKP3YOJc9UcxJKkUyIReBpjdoYORMSRGI+cWWtO4VRAORx/
 0Nf3qLx0vPqrZf8Q0juqRl0526qNJiduqTGdkGLJ0vNCA8AYwiaILsrF8BldDOPSAtlT
 ztyOMF5iEN83NAcmZyDf64qrVw1MXSZ/GEygxBXPf6zWczM5xt6XiNj/Zk7GjQR5stjW
 NNqLfSn+a7/tMJsWiDjN537KqrZ3epffyEUFQPpak8QbFzpPv0pWyL86WdZ+LkAWZ/8z
 f/Ig==
X-Gm-Message-State: AOAM533Lr7YioCaMD5vNMJVczgRnKtAmxAm2hO6mJoZcZp9REhPttq1+
 5cT9t3HZGMako0qLEh8w/pQaItizrVbzNpY2rM8=
X-Google-Smtp-Source: ABdhPJypHP+8lAnojHqsj+HMjv2Kx5qQD1vR1U48FukFJAYIMQIqPx17kRoJyhSS4FcPT0MB5slRlnJYgqYSUKBAAmw=
X-Received: by 2002:a05:6808:4c5:: with SMTP id
 a5mr7370620oie.175.1597235526662; 
 Wed, 12 Aug 2020 05:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <87h7tpa3hg.fsf@nanos.tec.linutronix.de> <202007301113.45D24C9D@keescook>
 <CAOMdWSJQKHAWY1P297b9koOLd8sVtezEYEyWGtymN1YeY27M6A@mail.gmail.com>
 <202008111427.D00FCCF@keescook>
In-Reply-To: <202008111427.D00FCCF@keescook>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 12 Aug 2020 18:01:55 +0530
Message-ID: <CAOMdWS+nJr+g1c0Kb99Z=HwQjHtH_-NCC9hW-o6xFs4huGKsqQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (allen.lkml[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5pvQ-00AgnP-8K
Subject: Re: [Kgdb-bugreport] [PATCH 0/3] Modernize tasklet callback API
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
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-input@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Romain Perier <romain.perier@gmail.com>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Kees,

> Was a Coccinelle script used for any of these conversions? I wonder if
> it'd be easier to do a single treewide patch for the more mechanical
> changes.

No, I should have written one. Will do it.

> And, actually, I still think the "prepare" patches should just be
> collapsed into the actual "covert" patches -- there are only a few.

Okay. It's been done and pushed to:
https://github.com/allenpais/tasklets/tree/V4

> After those, yeah, I think getting these sent to their respective
> maintainers is the next step.

 Please look at the above branch, if it looks fine, let me know
if I can add your ACK on the patches.
>
> Sure! I will add it to the tracker. Here's for the refactoring:
> https://github.com/KSPP/linux/issues/30
>
> and here's for the removal:
> https://github.com/KSPP/linux/issues/94
>
> if you can added details/examples of how they should be removed, that'd
> help other folks too, if they wanted to jump in. :)

Sure, Thank you.

- Allen


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
