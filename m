Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D75258AE3B6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 13:20:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzEC6-00011B-Th
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 11:20:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzEC4-00010u-2a
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 11:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YGgyJXKoN5L1hoziE8Pwb/hAAK4jMi3T8Y7cDVkU8b8=; b=Gdzb7vZy4evmHn/nmJ2beb5NPW
 kwoNofbigQSxBhMnZcKXc7AS1ibG68gPJtQlvvTvcJ6e6Kxgk07Agfy7dpNQKHO8fWqS7hOxAtXBx
 tr6I9ntgSeFYX8gImA7YogSnMPRYSVWqnwamuQJBKlbQThRZkS7kLFqC7O9i0OhDOCHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YGgyJXKoN5L1hoziE8Pwb/hAAK4jMi3T8Y7cDVkU8b8=; b=ZKMJQ6UXSlc4xTQBLsDcL4noDE
 JKhnr4yMKhY9jESSaKWg0w7tOKUgnuANLt76XnVm08UH28p0VX674Zfq3VDJ3/1q4tFz+0Gd2ZwD9
 9tZgF7fGfvYZh5IqkLwKaIT3CijPz0AIiUePF6MI5zHpoFQ96EILHFLJmqiCP1FBQgYc=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzEC2-0000Ou-V4 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 11:20:12 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41ab9619681so4519505e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Apr 2024 04:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713871200; x=1714476000; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YGgyJXKoN5L1hoziE8Pwb/hAAK4jMi3T8Y7cDVkU8b8=;
 b=ixbIR0GrB6Y466DIS1XisK16xiEuQOJ+BvlVLlx8AGs+8YEIHy5a388vjkGMROiYeE
 gax8Aydx2ay7Xmk6+Fxr6yqjVyULbxKqVoaJqtTMXcLxpmAHPbJkZHpZc1dVOOKfb9U2
 WrrzgkZmrbOqmg2O9ocduzu0U9+exw8/AL/8otHDmG9vGYBW/e50SkYZGv/PGRj/a9t4
 j84OoJAHvkmNlBtOZtkGG5Fn9CQyQr+qYXaV6K2Chj76c9urcIkVXOE9Wvzbg5x+r7dt
 +Y320h+DwTnqGdHYdz5505h9MRtV2FAK3dpjUV5T+TMsLD4lAqJKL2WqqUVZTPJ+wIjy
 4QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713871200; x=1714476000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGgyJXKoN5L1hoziE8Pwb/hAAK4jMi3T8Y7cDVkU8b8=;
 b=ZQiVtlNn2mVhMNIo2NcR4nnbMBEnw/6NQyeQC2vHQhKiqFyCEleDX6bLXRtg6zizZM
 5PDQ1GkO/K2XAzT8CALg2LqPz2fZCi/evV+rZ4cFAkQ7G58V+MOYR0ZfIiB16YpvW/0k
 2Iu0k++PSSK3qtQIGrocPrhsPC2mjeZkHh0lWRg6shhrsa65cPw0pN5r3FCRZ4RkARoj
 e48o+fvkMJNYTrPWpX1XTtNwn9URKpAe9PZTuAubeZbpPl3mDAP3TwIJrqq1fONDm89Q
 9qkKybqXBfvoVZtU8+FkBO1gAZdm7QXmJXlSE49Lf1/bNUQ2BRh7NXpyySl7KXxvAO6u
 fyNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULJeNj43iA+yvma4SjkHfHhR4I6Knn9L3vPlqmZo6ghn/rHgJdzUZ+Upk1QA/RfK5+0ottM6tSX5+1+AG3b/jPD1jBokKse8cRbnGQhxbKBd8j7L4=
X-Gm-Message-State: AOJu0Yw2qwaJFrEapeWPIMBnRzg0PNzSpeers67sx9lBvQ9J1G6YONNa
 NKH4NSWd57U+M1vXEJz9VdF22Nd6pXytXCIeGJzm4C+MMNqIxFzlpDANJxiTjRoZPAgmMXQbvCQ
 Wib4=
X-Google-Smtp-Source: AGHT+IHMKxMg+gfHErSx5FW+vINajDp9UAb8VLTHQPc43/6ff53K4UznbcECiMb2/I3QUr5myH9RuQ==
X-Received: by 2002:a05:600c:470d:b0:41a:c592:64ff with SMTP id
 v13-20020a05600c470d00b0041ac59264ffmr983585wmo.35.1713871199993; 
 Tue, 23 Apr 2024 04:19:59 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g4-20020adff3c4000000b00343c1cd5aedsm14309973wrp.52.2024.04.23.04.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 04:19:59 -0700 (PDT)
Date: Tue, 23 Apr 2024 12:19:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <20240423111957.GD1567803@aspen.lan>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <kvmf4hcnoeuogggx5jmcqjch32shyswjv5cqvg4hwdg4g27rup@t4ddszao3354>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <kvmf4hcnoeuogggx5jmcqjch32shyswjv5cqvg4hwdg4g27rup@t4ddszao3354>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 22, 2024 at 10:49:29PM +0000, Justin Stitt wrote:
 > Hi, > > On Mon, Apr 22, 2024 at 05:35:53PM +0100, Daniel Thompson wrote:
 > > Inspired by a patch from [Justin][1] I took a closer look a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rzEC2-0000Ou-V4
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/7] kdb: Refactor and fix bugs in
 kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Apr 22, 2024 at 10:49:29PM +0000, Justin Stitt wrote:
> Hi,
>
> On Mon, Apr 22, 2024 at 05:35:53PM +0100, Daniel Thompson wrote:
> > Inspired by a patch from [Justin][1] I took a closer look at kdb_read().
> >
> > Despite Justin's patch being a (correct) one-line manipulation it was a
> > tough patch to review because the surrounding code was hard to read and
> > it looked like there were unfixed problems.
> >
> > This series isn't enough to make kdb_read() beautiful but it does make
> > it shorter, easier to reason about and fixes two buffer overflows and a
> > screen redraw problem!
> >
> > [1]: https://lore.kernel.org/all/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com/
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> Seems to work nicely.
>
> There is some weird behavior which was present before your patch and is
> still present with it (let >< represent cursor position):
>
> [0]kdb> test_ap>< (now press TAB)
>
> [0]kdb> test_aperfmperf>< (so far so good, we got our autocomplete)
>
> [0]kdb> test_ap><erfmperf (now, let's move the cursor back and press TAB again)
>
> [0]kdb> test_aperfmperf><erfmperf
>
> This is because the autocomplete engine is not considering the
> characters after the cursor position. To be clear, this isn't really a
> bug but rather a decision to be made about which functionality is
> desired.
>
> For example, my shell (zsh) will just simply move the cursor back to
> the end of the complete match instead of re-writing stuff.

Interesting observation. I hadn't realized zsh does that. FWIW default
settings for both bash and gdb complete the same way as kdb. Overall
that makes me OK with the current kdb behaviour.

However I was curious about this and found "skip-completed-text" in
the GNU Readline documentation. I think that would give you zsh-like
completion in gdb if you ever want it!


> At any rate,
> Tested-by: Justin Stitt <justinstitt@google.com>

Thanks.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
