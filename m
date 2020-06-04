Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9C1EEA23
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Jun 2020 20:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jguPo-0001Qa-CE
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Jun 2020 18:16:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jguPn-0001QT-3Y
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 18:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I+DfKN1U5A03BOeIRGNtGiuZF8U9fpy/yodWoM58tKM=; b=WwMTRH11d/6jvnsm1KigA6gdXE
 4ta31fMsisf/lLWzI3kTUdHYSFF38ARvaAzdlYn8JboRWXaHCb6lkyvT62emXsS1O/uQulY/ru25f
 BS5n4OAodKQBt0gO9gNW0SSmXbZWM3ROHZcUMOVF1SJh8/lDwp/i6rgycWEMUjpOZmO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I+DfKN1U5A03BOeIRGNtGiuZF8U9fpy/yodWoM58tKM=; b=jH3sSZ9AERXlu+MlKtONFQyjl2
 SN5p8q79lHBz4c7Pp1f/9VZQi/5WbeON0u5MYTWVSJwGQK7UPgi+gShWD5gRDbrFMJBTEAuMbZZpz
 KQeMKrH9/V6r/tM30p88siWQNmG63PBfVG33NhMiLv1EFGIbkKjh4Z6cDkQjs8Pm1dXc=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jguPl-005oww-8m
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 18:16:31 +0000
Received: by mail-pj1-f66.google.com with SMTP id i12so1479030pju.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+DfKN1U5A03BOeIRGNtGiuZF8U9fpy/yodWoM58tKM=;
 b=MeStlUVuDIDY8xlSqAdqiPbvepR4yUM08hcSMfi+Bf9woO4keQy4f9hJFgaegH3vn9
 QfqNz8NGOOVFillN/77/HKy930Ycko1/D1/85dJ3VnTUyDq0l8r4IUcREybotGncf836
 Kdd/d1vBIM9HazX5nDs8lehudmCBjs2RicpWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+DfKN1U5A03BOeIRGNtGiuZF8U9fpy/yodWoM58tKM=;
 b=VwJJsVNsx8tXT4/tqNTQJ9e0fNnSSgi6W5+xo6xPtXlELsNLGGhhrAFt6EBm6fCjWe
 lTHjV6DHmfizHJK4LFVU9hkWFaP53MofTUwHFpPniaJobbK9GpGOdxBFMScwVHN6mOuD
 CXzEnpdti8HUhMQ3rcVuGrebNwQcMbAn7Lu3lBZiB9SnyoPNWJ91RmFsOAW1mm8GzcfW
 HhJgCvMiX+aIKg8OAcnQ3bAxzoOYI2VBAyp2h/LzaOfurgSxLp1MpyTFmd91WpeRg6YH
 bRwEcAOExg5TIL+QvzJRlONOqmDWC5daGqYPtO7PpiuY/qYTMN8i4MTk5SPv/VbOSmCT
 RADw==
X-Gm-Message-State: AOAM531TdApe2NHzvr9rY3HNzCVcqBtPaEqZ8vMEW38NEV3ob7htZ6xy
 FJYf/ymMTB+sKp+iSrmtgIg6oexHEA0=
X-Google-Smtp-Source: ABdhPJw70QwAcJ1Twv+1wWtDwh9F6w0hpv1IdR2vw9t1W3ttCu72rAm3l4CJ/aihqUVjcYqcHJMZLg==
X-Received: by 2002:a1f:3655:: with SMTP id d82mr4298792vka.1.1591292799259;
 Thu, 04 Jun 2020 10:46:39 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id b85sm630511vka.39.2020.06.04.10.46.38
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 10:46:38 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id r9so2373044ual.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 10:46:38 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr4429632uaf.22.1591292797964;
 Thu, 04 Jun 2020 10:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200507153444.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
 <20200519104151.6evv3hizm5dbjjq2@holly.lan>
 <CAD=FV=XCFxgO-s--jw9CTgQUxtQfteoQ4XSL_bbjW4s82Wd3pg@mail.gmail.com>
 <20200601161952.3hx6sv5hzdnjnvtj@holly.lan>
 <CAD=FV=UJLTuMp0uvTY0rC51ir_GgRKYxiPCK_w8TY+MBzkqjeA@mail.gmail.com>
 <20200603120051.dxpavvsxvsxnvuct@holly.lan>
In-Reply-To: <20200603120051.dxpavvsxvsxnvuct@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Jun 2020 10:46:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULq602hW2cvzfCN+QK_kcrd=wZUXfRJDLMzqJted4fog@mail.gmail.com>
Message-ID: <CAD=FV=ULq602hW2cvzfCN+QK_kcrd=wZUXfRJDLMzqJted4fog@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jguPl-005oww-8m
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Avoid suspicious RCU usage
 warning
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Jun 3, 2020 at 5:00 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Jun 02, 2020 at 03:56:33PM -0700, Doug Anderson wrote:
> > > > 2. Perhaps remove the whole irq saving / restoring in kgdb_cpu_enter().
> > >
> > > Are you feeling lucky?
> > >
> > > I think there will come a time when bravery is called for but I'd rather
> > > see this as part of a bigger rewrite instead of a single high risk
> > > change.
> >
> > Hrm, maybe.  I guess it depends on whether we want to take baby steps
> > there or try to do it all at once.  If we take baby steps we will
> > occasionally fall down but we'll slowly start getting things cleaned
> > up.  If we wait for a full rewrite then we might be waiting for a long
> > time.  It'll also be harder to figure out which of the big changes in
> > the major rewrite broken someone.  ...or if the major rewrite comes in
> > 20 small/bisectable patches it may be hard to revert patch 2 out of 20
> > if the future patches all build upon it.  If we do one small high-risk
> > change and then wait before building upon it then it'll be easy for
> > someone to bisect and then yell for a revert.
>
> My views are a bit too nuanced for me to agree or disagree with this.
> I'm not against baby steps and I definitely *don't* want kgdb to
> continue to be preserved in aspic.
>
> However I'm still reluctant to start our baby steps with a "let's see
> if this breaks something" patch given we know it could be a very large
> number of kernel cycles before we get an answer.

Yeah, it's kinda amazing how much of a delay there is sometimes.
Perhaps all of the kgdb users are off on downstream kernels so they
only notice changes when they re-sync up.


> I would be much
> happier if those baby steps started, for example, with refactoring to
> decompose the beast into clearer (and dare I say better documented)
> functions.

OK, makes sense.


> Or put another way, even if someone sent me 20 small bisectable patches
> in a single kernel cycle I'd still want the high risk bits to be
> towards the end of the patch set.

OK, fair enough.  You're the maintainer so it's your view on the
matter that's the most important.  I guess one worry I have is that if
neither you nor I really understand the code path that a theoretical
system would take if it didn't already have its interrupts disabled
it'll be hard to keep from breaking it in making other changes to kgdb
in the future.

Anyway, enough discussion for now.  ;-)  My v2 should work like you
suggested and I'm not planning on any other short term changes to this
function, so we should be all good right now.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
