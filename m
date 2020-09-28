Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434727B7B8
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Sep 2020 01:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kN2MO-00015E-Tv
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Sep 2020 23:15:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1kN2MN-000157-K4
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Sep 2020 23:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kwjW9aVhaH3Akzu5Far0IJ9TvL77Wnb7vo0nK8ZII38=; b=Y0jWlPec2mMX5QNkdErJ9jiv3b
 MrfYzK9QXc9ipyMIlGQxAuSGN8WTMlKQFj8vNte8Cc1a4DPeE64NG8pMxmZpMFUrP77HXmJZ4CjJD
 K7jCjDSy1KVZh6++oKxvxZxm+Mcc5lPlaKVvMAhkYVmPsEIXD7n0leGe5hnex1EkMo0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kwjW9aVhaH3Akzu5Far0IJ9TvL77Wnb7vo0nK8ZII38=; b=QvFNeEKZ/lIgg4XtJWEzPxOuGm
 LtgCK93T5ueQjksIOwa7zrZqjgUsUJ4KB2/J/T+on8s3LczUZ4AXmgVTt9zPFkWEIK26lPgdo7gFv
 1cYNyGq+mmMdKfAD/rBTah/SG+lmL88/Bl4+3Rb7Pyo+WUGW5DKKea2Kb23NxQM6IIro=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kN2MJ-009Nqi-B1
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Sep 2020 23:15:07 +0000
Received: by mail-pg1-f193.google.com with SMTP id s31so2248819pga.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Sep 2020 16:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kwjW9aVhaH3Akzu5Far0IJ9TvL77Wnb7vo0nK8ZII38=;
 b=Hsrfj84emk5bg/vkeMeiJqZFbpfVVaUk3h76uCV1XQ6lC7+s63GLenwoiLxRmGJztj
 b0Cnn/lq5zkeN4AvGNMc2h7u3bG4QqQsKRCnwKojhTM7nZHN1nT+u6rhjKS5nzsrKLw4
 5xf1rq6O6v1YuUJDvN6mBxgRRxEAeFb1yRlcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwjW9aVhaH3Akzu5Far0IJ9TvL77Wnb7vo0nK8ZII38=;
 b=e8jdSE7EEkyrn6U1a7WqeNj0CC9zb/TQ7eW3U/uykw5JQ5Mh/dEr7fO4iqEzAWKz2S
 qLvX/4l/iyK7JNu4dXW+FCvR0WONrbgrd4AmCFWAjeEGdhdT+X3DccMTPxItzZo0UPMa
 MKMc5yIR1Uf4bfVOKeNVZO8AKlaXcYzLUPlxn62CmlENdrTMee5f2AcVtDhvkZST8wEa
 lZyVvu98F/wX/VrRwXb61IrzJqsAfjSr3QtiGepIb+atmNDwJ5eH1TbBYDGF3qx0N0il
 hZmS0jeR4TWm3FHSkwnwP2O0SxxrtZwSGIsXazNN7X9EL4eetgnuVC3VvvMtDlpf4fwa
 wKbw==
X-Gm-Message-State: AOAM531xKKU1VvRB8Vp/i2f0TEwfz32cnrWVqCfInfMiBbo8xdY68eb8
 2oSiv1QnsiXlsJph1g36UI7x5B6GZfwwdg==
X-Google-Smtp-Source: ABdhPJxLD0ok8MvRwkLL3ZOl/gyFNwnbWchAEotF/mzn1CJ4JXQnJBUdj5eNXykBnrsnq3sdON1ihw==
X-Received: by 2002:a67:eb03:: with SMTP id a3mr1249270vso.41.1601333065821;
 Mon, 28 Sep 2020 15:44:25 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id y5sm292651uay.0.2020.09.28.15.44.24
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 15:44:24 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id e2so1788700vsr.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Sep 2020 15:44:24 -0700 (PDT)
X-Received: by 2002:a67:ad0e:: with SMTP id t14mr1333581vsl.34.1601333064104; 
 Mon, 28 Sep 2020 15:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200927211531.1380577-1-daniel.thompson@linaro.org>
 <20200927211531.1380577-3-daniel.thompson@linaro.org>
In-Reply-To: <20200927211531.1380577-3-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2020 15:44:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X5Ro_MtGMJDCCjnB1_CPzRPHbZx5ovQ6L8JbpNNdyngA@mail.gmail.com>
Message-ID: <CAD=FV=X5Ro_MtGMJDCCjnB1_CPzRPHbZx5ovQ6L8JbpNNdyngA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kN2MJ-009Nqi-B1
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/3] kgdb: Add NOKPROBE labels on
 the trap handler functions
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Sun, Sep 27, 2020 at 2:16 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kgdb honours the kprobe blocklist but doesn't place its own
> trap handling code on the list. Add labels to discourage attempting to
> use kgdb to debug itself.
>
> Not every functions that executes from the trap handler needs to be
> marked up: relatively early in the trap handler execution (just after
> we bring the other CPUs to a halt) all breakpoints are replaced with
> the original opcodes. This patch marks up code in the debug_core that
> executes between trap entry and the breakpoints being deactivated
> and, also, code that executes between breakpoint activation and trap
> exit.
>
> To be clear these changes are not sufficient to make recursive trapping
> impossible since cover all the library calls made during kgdb's
> entry/exit logic. However going much further whilst we are sharing the
> kprobe blocklist risks reducing the capabilities of kprobe and this
> would be a bad trade off (especially so given kgdb's users are currently
> conditioned to avoid recursive traps).
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

I didn't go on any more hunts for missing functions since this seems
fine to me.  It's mostly just trying to make it a little harder for
someone to shoot themselves in the foot, after all.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
