Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81A443703
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Nov 2021 21:12:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mi095-0006xd-QT
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Nov 2021 20:12:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1mi08w-0006xN-DE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Nov 2021 20:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vSPlWm2hs69Rrwv7pMsIZ6ZEjm3Jr85/4hUvPPRbxSY=; b=eyl69uXAqcgYxVK/bgjQxqjDFq
 TV6B4hcSvZm8zDpZq8N8ofIb5cFuFrr3E1vPnXreUwumrsf7j15pufKi4dPZ1pm2qM7NEGYfbabHz
 0Gq2jxm/MXyHcTLqR1u1EGOXihEobOpZs85095tHNBCKZzxxEO+uypRis67scj4dTCP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vSPlWm2hs69Rrwv7pMsIZ6ZEjm3Jr85/4hUvPPRbxSY=; b=BEKj9SjQxkIFyYMkHqntzg5OuN
 BHa/bts/fcw+7LrSOhJKoRiTeZL3tPgszv3OwOhm34d0TY5oQCtgVnwHp0NWKuarB7skVoPhYjTT1
 XrVuEutHqt2J5+hq/B13Nn1Ipk9pCLKwGDcOJ078M4KQZNuv9sBOVS4ClgPUvneHtXtg=;
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mi08q-00FQT5-Ah
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Nov 2021 20:12:21 +0000
Received: by mail-io1-f53.google.com with SMTP id g8so114733iob.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Nov 2021 13:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSPlWm2hs69Rrwv7pMsIZ6ZEjm3Jr85/4hUvPPRbxSY=;
 b=HYAtKgTX3PWNExtxLEVgelwQbaKIcCqdFVUUlL+xjFymnNK4MBlki0KZ8xiwn5pTTU
 50wtyk9r0viovOjnSlH//z1q/vyUwgLFADoCTESoPdmsy921k2KE7d532c/UbGk5jQqg
 FppHvZTuqWz/yVxxXUfNpf0ZplB8TbeFFdhPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSPlWm2hs69Rrwv7pMsIZ6ZEjm3Jr85/4hUvPPRbxSY=;
 b=SNfhHTCwPDLHpKyHWkcuxfoVCvU+iWagSP8pjgztF73ZLmx9XMN4yCCRMxAVnTE85l
 DBX4kiM7vQhawbrVgKgfz4+ltIfsk+W97cgiMb7sAkneLE5G+T2qMpLKTd350Qve7apG
 N22+S1sWJET9InJNkkW3JuCPMx8jW2bHM2pGKsYWxugbV/4hL9jfvNfrKjNaESA5pqXQ
 /if+A021z2hbT59knmEB+C57BLu8YTsuuPTXn/oJDDfc0OwvaN8yTuglZrbrwI8qF7Yi
 ez8gFhD0dvhJ6//ER5Gn9tjG9PuPgsZXudd/Au+CTWaGC9f7BrOclY9ypQm+kUb2h1IU
 dsQQ==
X-Gm-Message-State: AOAM532Z3f5Dd6y1Nrc9FtC4yo6bbZrRvijDLcDan7HoYhYw7RoltgSe
 uJdewqKW/HkaqXZDImIAM0yXs9vWzQCOAg==
X-Google-Smtp-Source: ABdhPJw+D0gYwKGsDjVMKUXUWJCRNFWYkz+2Yu/WABLBr6AG8c+KSlXga/fo8MFQ1Vh82Lkx/L3Vcg==
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr27634171iof.64.1635883934576; 
 Tue, 02 Nov 2021 13:12:14 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id y7sm33564iov.22.2021.11.02.13.12.13
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 13:12:13 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id y73so150062iof.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Nov 2021 13:12:13 -0700 (PDT)
X-Received: by 2002:a6b:109:: with SMTP id 9mr2801480iob.128.1635883932783;
 Tue, 02 Nov 2021 13:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102173158.3315227-1-daniel.thompson@linaro.org>
In-Reply-To: <20211102173158.3315227-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Nov 2021 13:12:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uk43Y3L0oTAxR1YDBUO3axz3joK2NGkGNXQPbUPwerig@mail.gmail.com>
Message-ID: <CAD=FV=Uk43Y3L0oTAxR1YDBUO3axz3joK2NGkGNXQPbUPwerig@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Nov 2,
 2021 at 10:32 AM Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > Currently kdb contains some open-coded routines to generate a
 summary > character for each task. This code curre [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.53 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mi08q-00FQT5-Ah
Subject: Re: [Kgdb-bugreport] [PATCH v4] kdb: Adopt scheduler's task
 classification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Nov 2, 2021 at 10:32 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kdb contains some open-coded routines to generate a summary
> character for each task. This code currently issues warnings, is
> almost certainly broken and won't make sense to any kernel dev who
> has ever used /proc to examine task states.
>
> Fix both the warning and the potential for confusion by adopting the
> scheduler's task classification. Whilst doing this we also simplify the
> filtering by using mask strings directly (which means we don't have to
> guess all the characters the scheduler might give us).
>
> Unfortunately we can't quite match the scheduler classification completely.
> We add four extra states: - for idle loops and i, m and s sleeping system
> daemons (which means kthreads in one of the I, M and S states). These
> extra states are used to manage the filters for tools to make the output
> of ps and bta less noisy.
>
> Note: The Fixes below is the last point the original dubious code was
>       moved; it was not introduced by that patch. However it gives us
>       the last point to which this patch can be easily backported.
>       Happily that should be enough to cover the introduction of
>       CONFIG_WERROR!
>
> Fixes: 2f064a59a11f ("sched: Change task_struct::state")
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     v4:
>     - Get rid of the final `DRSTCZEUIMA` from the comments (Doug)
>     - Change "state [ism]" to "state [ims]" to match other uses
>       of IMS/ims (Doug)
>     - Fix broken english in the bta online help (Doug)
>     - Update ps online help to use <state_chars> to match other
>       synopses (me)
>
>     v3:
>     - Fix the uninitialized cpu variable (Doug and 0-day CI bot)
>     - Added a Fixes: (Doug)
>     - Changed "state I" -> "state -" and "state M" to "state [ism]"
>
>     v2:
>     - Fix the typos in the description (Doug)
>     - Stop trying to bend to world so I can keep 'I' exactly as
>       it was before. Instead we now replace 'I' with '-' and
>       fully adopt the scheduler description of tasks. kdb
>       it an interactive tool, not ABI so this is OK. (Doug)
>     - Don't try to enumerate all possible letters in the
>       comments and help. You can learn what to filter from
>       the output of ps anyway, (Doug)
>     - Fix the sleeping system daemon stuff.
>
>  kernel/debug/kdb/kdb_bt.c      |  16 ++---
>  kernel/debug/kdb/kdb_main.c    |  37 ++++++-----
>  kernel/debug/kdb/kdb_private.h |   4 +-
>  kernel/debug/kdb/kdb_support.c | 118 +++++++--------------------------
>  4 files changed, 53 insertions(+), 122 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
