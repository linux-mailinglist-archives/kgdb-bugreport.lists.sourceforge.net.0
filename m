Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B625DDFE
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Sep 2020 17:41:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kEDqA-0000B5-4n
	for lists+kgdb-bugreport@lfdr.de; Fri, 04 Sep 2020 15:41:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kEDq9-0000Av-5J
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Sep 2020 15:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2TzoBat9rSOZ6f++r+CepUVmCJOu3zYkmgghF9mksEs=; b=Wz8YxFZsUtXqQQGE1iWc0h1Adz
 ent2oB4VcJB5E5OaMyGFFVYF/FTDJSwNcDbSkvHwtRaclkmjIh27lltdIQ7Gv0/dRsRsc4luQm5vb
 1Jdvg1/SdHqEpL00xJT//Sd/z3mikS7+rpxOm9oHrIfIwtSbCxflUY4JKB+hqtyAHsk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2TzoBat9rSOZ6f++r+CepUVmCJOu3zYkmgghF9mksEs=; b=O9uZcToSRpl26ZDslf4ELaHNib
 v5Uw3c12ZthOn2D00s9WT3oVTVIhhPBV0GfJ3/RyR02zB5+0z2VIbLqFWLMM8vjC9UMMF2L+aom/i
 Q5Jf+eztNJ5nBl2yR80mxAKgQGmZXzn7ky0GyQAdfmVGWYKQLjTQxHnuudzO8PkPguHk=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kEDpy-00CETf-Jc
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Sep 2020 15:41:24 +0000
Received: by mail-wr1-f68.google.com with SMTP id t10so7233657wrv.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 04 Sep 2020 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2TzoBat9rSOZ6f++r+CepUVmCJOu3zYkmgghF9mksEs=;
 b=YnlEN4f7iF+L8Q2CLkv0licnnoCK1sE20W+PiA6DQxq9uzUghg6CdEFLBuBsZab07N
 kWBC+5MR8a30w/2UZmUW0CFe9NU3v5xelGM/wUSAByE7li5cGhXYGk44PpEZLPP4ghCC
 LwI2/fuDs+iBM00pNEHsfT8B87WYLBzlRSgKnef+klltPoKq7QcUE49JhbE0Kc0x6dRe
 DLfLwu9x0k8ET5+QM7n/g0XxhdpsXtt31PonhoyMWQVABgWPqfLO+sjDxNOY3WmOYvul
 kKCGsCWVfLeYgoW6s9vHiHY0YOPYFSMlskcwTd8aa7j3IgT1u4s6B60J8mu2IpvwuVgD
 5YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2TzoBat9rSOZ6f++r+CepUVmCJOu3zYkmgghF9mksEs=;
 b=hVVa7xUfnBRV7K2xazdK0eeUy/zLnWA+xAd5oxw2qa1cb+PwBJcYfSQuZdjB/lin9w
 lYN0hpVBSUQO/F7nVudq46tWQsNYt/KsEDo2uMzo6NfI+0XM/TWOT6outHAiV+F5/yJ9
 evpCWb36Z0HHhNsi592Zadb6snUOS/+Y4yZi+8PPQAIqqTZzf8QZHGmsek0MdV+Famnv
 +AHErCZukWH0ujxeJKAjDMyUziakQi3CTlF2tIN4oiaXb/EsvdwQk200PSY3UxylxZ7W
 p8HHGguPtEn863x7Ly4XFq+Z/D36d12MlZFfPqFE2PUTNMLNLTHxUJMJCabVW40b3jTj
 ZM9Q==
X-Gm-Message-State: AOAM531ToMJS4dC2kLNwu4/Xiddp20SFos7bNYomKSov/6n6EDT7pKdv
 AKynntcDLYb0YOW9nl1GnCzK8g==
X-Google-Smtp-Source: ABdhPJz9OexeGYtGOyyjCI7anjKl2LCCfHPKb7HFS1IgEZtNKIcVFCxXhMEfjgz2pFwwFZuU6kqojw==
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr8233226wrt.26.1599234060917;
 Fri, 04 Sep 2020 08:41:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y5sm2733111wrh.6.2020.09.04.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:41:00 -0700 (PDT)
Date: Fri, 4 Sep 2020 16:40:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200904154058.qdrdkkctfs66ouw2@holly.lan>
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-4-daniel.thompson@linaro.org>
 <CAD=FV=UBMa4pt7Xg2sKXHdjo6tVaQWBQFtT_aoDJ+Xt1HrPD+Q@mail.gmail.com>
 <20200720081323.5f3xojhu6v23jgqi@holly.lan>
 <CAD=FV=VipxFspgHJZ0uKURyfE4e3GB-w3gyJZdRn5CF9aLT8fg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VipxFspgHJZ0uKURyfE4e3GB-w3gyJZdRn5CF9aLT8fg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kEDpy-00CETf-Jc
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/3] kgdb: Add NOKPROBE labels on
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

On Tue, Jul 21, 2020 at 02:22:08PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 20, 2020 at 1:13 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Jul 17, 2020 at 03:39:58PM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > >
> > > > Currently kgdb honours the kprobe blocklist but doesn't place its own
> > > > trap handling code on the list. Add labels to discourage attempting to
> > > > use kgdb to debug itself.
> > > >
> > > > These changes do not make it impossible to provoke recursive trapping
> > > > since they do not cover all the calls that can be made on kgdb's entry
> > > > logic. However going much further whilst we are sharing the kprobe
> > > > blocklist risks reducing the capabilities of kprobe and this would be a
> > > > bad trade off (especially so given kgdb's users are currently conditioned
> > > > to avoid recursive traps).
> > > >
> > > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > > ---
> > > >  kernel/debug/debug_core.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > >
> > > I could just be missing something, but...
> > >
> > > I understand not adding "NOKPROBE_SYMBOL" to generic kernel functions
> > > that kgdb happens to call, but I'm not quite sure I understand why all
> > > of the kdb / kgdb code itself shouldn't be in the blocklist.  I
> > > certainly don't object to the functions you added to the blocklist, I
> > > guess I'm must trying to understand why it's a bad idea to add more or
> > > how you came up with the list of functions that you did.
> >
> > Relatively early in the trap handler execution (just after we bring the
> > other CPUs to a halt) all breakpoints are replaced with the original
> > opcodes. Therefore I only marked up functions that run between the trap
> > firing and the breakpoints being removed (and also between the
> > breakpoints being reinstated and trap exit).
> 
> Ah, OK!  Could that be added to the commit message?

Will do.
 
> Also, shouldn't you mark kgdb_arch_set_breakpoint()?  What about
> dbg_activate_sw_breakpoints()?  I haven't gone and extensively
> searched, but those two jump out to me as ones that were missed.

Agree. I think I over-focusses on the entry path. I will review the
exit path more closely.

> I suppose that means that if someone tried to set a breakpoint on a
> kgdb function that wasn't one of the ones that you listed then the
> system would happily report that the breakpoint has been set (no error
> given) but that the breakpoint would just have no effect?  It wouldn't
> crash (which is good), it just wouldn't detect that the breakpoint was
> useless.

Assuming the kgdb function is used exclusively from the trap handler
then this is correct.

> However, if these were in the NOKPROBE_SYMBOL then you'd get
> a nice error message.  Is there no way we could use a linker script to
> just mark everything using a linker script or somesuch?

You'd still get odd effects with library functions that are used inside
and outside the debugger (which can be breakpointed but don't trigger
inside kgdb). Arguably the effect is clearer to users if they can see
kdb/kgdb functions behaving the same way as library functions. It's odd
but it won't promote false expectations from users.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
