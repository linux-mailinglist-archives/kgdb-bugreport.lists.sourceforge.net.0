Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CC1ECF31
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 14:01:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgS4w-00043B-Ac
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 12:01:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jgS4v-00042z-97
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 12:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTDVs9sQITF8PtVFEimxH6R+QQ7jkpl/DjppsVLboHk=; b=MuWTnUKRaM+UUgdgMcfy94UMgH
 APPv5d+gTVlMPyGYRIWwLB1U8VI7awArFWH3CZu9VrRY7wFiJ95hV1QE12bDQZiSBpqyrrGHIaS1j
 UenA28GVCBOAbTID4MOkPDm8krYgKA85qCBYbC19yZnJOoWG4Jsu64+xMUNXAPuSPjsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTDVs9sQITF8PtVFEimxH6R+QQ7jkpl/DjppsVLboHk=; b=LZqFcMnnYRnRYqDO6ZGvK4DnbR
 3B5qtykqqmV8VgcqR9XVxqjpfW3Awt8HtmAo5xkIkYeGFpdToti9TPwFTNv1wsHpaj0+Bi34Vpq+W
 Satm0JvUCeGOTxbNVla9rEy2AqPCfhiMywrwFzpxGk8OenoWNoLFRutqshCHa2TyOp68=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgS4q-003sdA-Nq
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 12:01:05 +0000
Received: by mail-wr1-f65.google.com with SMTP id r7so2086501wro.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xTDVs9sQITF8PtVFEimxH6R+QQ7jkpl/DjppsVLboHk=;
 b=SVRA/AEzNxpf6JeGg45AzqA5FnEm+cjIatVo7SjKYVUfPYilY1zQFr/z9lM42UFwDa
 UAZqwKy0UEGRzVWddeYEj0nA4IP3nnTVub7qjwFNTy79TmsAo0LxsA/SV8rcQ9QY6Vb4
 IX/jxKG3h4mnxwOBsqYCNMjn1tW4mDh5HU2SR/jCpv3z05RJrjsWEuTokGxkH5Rna1Rq
 SvWSZ+qUPfmfJluGz0YMcEt7HjgUGAiQM2curUW37O4NlnHWfRR73a5N5ipW2EH7XJXc
 nwPStCI+Vi9wp/MRP3R64XisUI7pzIQFKQjpozkbxVgG58p4SLIvMI9T6DwmxN77bdTS
 arPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xTDVs9sQITF8PtVFEimxH6R+QQ7jkpl/DjppsVLboHk=;
 b=SN0DS/YvaMvmvPeUoOacFanhCaaxXvRw8rq9wbopxAkJQqmtXN6RrQggmnbS2Tos48
 1D9CshHlcqrc66P6OfOF4zPpknuahDs+3DRWgsDVY7cWiIpS8P4pgnzXVbL/iOyLC7W0
 W0kejn4YVzK6bRv63q/M77l0utPfuagActWyILQmhR0buKYTBQJVOcAdvugKxhDnmZnR
 pTEE03EoTjXlyUQYIzNh6FQ3NgFQNuXXt06cUN6Dj1Vg/eEDkm/+UgP/iPZ+Yvc4mqRX
 LJd2bMAvxuAUDhrG50G9lMRaY0NVfn293bbFBtzwvjBqyvX7bQ9t1+KItVXu1YI8+btd
 VKKw==
X-Gm-Message-State: AOAM5330FwojySuq5m5hjCX3JkUG8+GeYXbGVmyA1lwf7XOM/aJkazFf
 GNcgZ73HdqimEpN3QllCfvi5Dw==
X-Google-Smtp-Source: ABdhPJzu/bnyi+AE+YNlwp0XT03QeNp72jC1XtT2CGSdSHBFClcTUXIDmgM+UuXmqvjSFx8yHb1D9w==
X-Received: by 2002:adf:9d8f:: with SMTP id p15mr30832324wre.421.1591185654096; 
 Wed, 03 Jun 2020 05:00:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d191sm2301565wmd.44.2020.06.03.05.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 05:00:53 -0700 (PDT)
Date: Wed, 3 Jun 2020 13:00:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200603120051.dxpavvsxvsxnvuct@holly.lan>
References: <20200507153444.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
 <20200519104151.6evv3hizm5dbjjq2@holly.lan>
 <CAD=FV=XCFxgO-s--jw9CTgQUxtQfteoQ4XSL_bbjW4s82Wd3pg@mail.gmail.com>
 <20200601161952.3hx6sv5hzdnjnvtj@holly.lan>
 <CAD=FV=UJLTuMp0uvTY0rC51ir_GgRKYxiPCK_w8TY+MBzkqjeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UJLTuMp0uvTY0rC51ir_GgRKYxiPCK_w8TY+MBzkqjeA@mail.gmail.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgS4q-003sdA-Nq
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

On Tue, Jun 02, 2020 at 03:56:33PM -0700, Doug Anderson wrote:
> > > 2. Perhaps remove the whole irq saving / restoring in kgdb_cpu_enter().
> >
> > Are you feeling lucky?
> >
> > I think there will come a time when bravery is called for but I'd rather
> > see this as part of a bigger rewrite instead of a single high risk
> > change.
> 
> Hrm, maybe.  I guess it depends on whether we want to take baby steps
> there or try to do it all at once.  If we take baby steps we will
> occasionally fall down but we'll slowly start getting things cleaned
> up.  If we wait for a full rewrite then we might be waiting for a long
> time.  It'll also be harder to figure out which of the big changes in
> the major rewrite broken someone.  ...or if the major rewrite comes in
> 20 small/bisectable patches it may be hard to revert patch 2 out of 20
> if the future patches all build upon it.  If we do one small high-risk
> change and then wait before building upon it then it'll be easy for
> someone to bisect and then yell for a revert.

My views are a bit too nuanced for me to agree or disagree with this.
I'm not against baby steps and I definitely *don't* want kgdb to
continue to be preserved in aspic.

However I'm still reluctant to start our baby steps with a "let's see
if this breaks something" patch given we know it could be a very large
number of kernel cycles before we get an answer. I would be much
happier if those baby steps started, for example, with refactoring to
decompose the beast into clearer (and dare I say better documented)
functions.

Or put another way, even if someone sent me 20 small bisectable patches
in a single kernel cycle I'd still want the high risk bits to be
towards the end of the patch set.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
