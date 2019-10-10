Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2ACD2EB5
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Oct 2019 18:38:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iIbSO-0000iB-Mg
	for lists+kgdb-bugreport@lfdr.de; Thu, 10 Oct 2019 16:38:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iIbSN-0000ha-4M
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 16:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ph+cM1wqiv/orbsFFGXeEKlbXh51icoHvALffiLcYf0=; b=T5qOKdDpD/yt+KXWx0kQu+v/7v
 RFt40ABUY/meWkhiypndS6Wu6VeyiRjwxlt2yX6DqVxw7oQc6jHxcw9pTaZPJmK3KRoqVwdaKrjbP
 fU9s01vFJbYOlBBtWg+2SCr6P/WEp1kkinfRQcYi5PZY+VZsVNy3OpNlC4mbEaI5mhjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ph+cM1wqiv/orbsFFGXeEKlbXh51icoHvALffiLcYf0=; b=TpBGoRc/7gVHoG4r7jHH56k3WZ
 6svw6O7aO/rL7lYsfTJYx4mf4ETxlrnZ5PRI3Ma9y+TlFZ3k8tNvrNDbJLd5mgzvE10X4f4BR4T97
 EkIROCbhXwpeuOeE4tScpb8cxbKzYBBP/7TcwJM9D2FSo1POBnyD1o2k6MoSfG/iId5Y=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iIbSL-005CK3-Oi
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 16:38:27 +0000
Received: by mail-io1-f67.google.com with SMTP id h144so15120179iof.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Oct 2019 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ph+cM1wqiv/orbsFFGXeEKlbXh51icoHvALffiLcYf0=;
 b=MzCP3JEh+/LlXlx0pBedozlo0FoZD5596/N3hdLGFXDY7yle3Gbnuy0SOR+2tzLqTW
 pJ7aFSAUD2tSeLCAS1SLIU1wJoZQJF33bVsjoTDQT19NMIzC/vf8WRVb7YA7dh79T3wO
 NU8cD67l6lYlGFfxwNY3bs1mg5iGsqMN1C34M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ph+cM1wqiv/orbsFFGXeEKlbXh51icoHvALffiLcYf0=;
 b=mxdOY6AfZM2ckdqyXP4O9rrVFNCzA1cUern7BJ5lnofNKfYWjLYKFO7lZaTew0d7UZ
 6Whgu9eGeWwvuA01UAioZqxpO32+Ze+irZvbD6C76gaHMDcq4iy8SxelUWnwiYPbBuUc
 OyhE0mOXqyG/ZqXO85fIdwk958Oc6ufqxFVQpSg8FeUaqZt/HisJ3aseNi4mAfDusyJA
 hjth8A/1y8h2B3yOQBzhlDfCzbtF6uJDaf5XHoWaESBZX1UCpcPnLqdu5LD20EeDE195
 QzL/GgTize1aG/+JbFFRDlfC1dQ6ICBWjmR17sp7OgXZloUijLiSKZ6Rv0Q6YVG9Tunc
 uGuQ==
X-Gm-Message-State: APjAAAWQoQm2DKvflPmlON351V3hEbGOYoVtFzRTmvhsFfYBG4MgliF8
 156fvS9BbMY/kGdkLBxu4UDP4SUzEXE=
X-Google-Smtp-Source: APXvYqxJgLP/DZpsZEJrW3BwbT11xkMfQz1N2RgaZRBZm32x3ZDTKBGeWAXzNmdEs8b3SAEJGfmqig==
X-Received: by 2002:a5d:980a:: with SMTP id a10mr142978iol.225.1570725499560; 
 Thu, 10 Oct 2019 09:38:19 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id c4sm4691113ioa.70.2019.10.10.09.38.18
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2019 09:38:18 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id h144so15119992iof.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Oct 2019 09:38:18 -0700 (PDT)
X-Received: by 2002:a02:90c7:: with SMTP id c7mr11362682jag.12.1570725498188; 
 Thu, 10 Oct 2019 09:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
 <20191007135459.lj3qc2tqzcv3xcia@holly.lan>
 <CAD=FV=Vqj9JqGCQX_Foij8EkFtSy8r2wB3uoXNae6PECwNV+CQ@mail.gmail.com>
 <20191010150735.dhrj3pbjgmjrdpwr@holly.lan>
In-Reply-To: <20191010150735.dhrj3pbjgmjrdpwr@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Oct 2019 09:38:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuOVpvEB60-prMxuPyjcrJ-9O2hyaLKf86c-r9BVocdg@mail.gmail.com>
Message-ID: <CAD=FV=VuOVpvEB60-prMxuPyjcrJ-9O2hyaLKf86c-r9BVocdg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iIbSL-005CK3-Oi
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Fix "btc <cpu>" crash if
 the CPU didn't round up
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Oct 10, 2019 at 8:07 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> > Reading through other control flows of the various backtrace commands,
> > it looks like it is intentional to leave the current task changed when
> > you explicitly do an action on that task (or a CPU).
> >
> > Actually, though, it wasn't clear to me that it ever made sense for
> > any of these commands to implicitly leave the current task changed.
> > If you agree, I can send a follow-up patch to change this behavior.
>
> Personally I don't like implicit changes of state but I might need a bit
> more thinking to agree (or disagree ;-) ).

I can post up a followup after this series lands and change it.  I
have a feeling nobody is relying on the old behavior and thus nobody
will notice but it would be nice to get this cleaner.

BTW: if you want me to spin to fix the commit message typo that Will
found or add his Ack to the series, let me know.  Otherwise I'll
assume that the typo can be fixed and Acks added when the patch is
applied.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
