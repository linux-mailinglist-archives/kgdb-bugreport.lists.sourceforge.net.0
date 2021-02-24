Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA11B3243AA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 19:21:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEymf-0007zD-OS
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 18:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <akpm@linux-foundation.org>) id 1lEymf-0007z6-3g
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 18:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e0rbFj2QZFSP1e04HW49nEV/AboE08y0zDD96T8/4DE=; b=LjSsXFUtw8g6Lz+fhZxu3DLNGv
 +nlG4iC89uVXZCkiKaQoKsjZO90PgmhDMLYwMtAWIQp4jjcPjOLk7SjeLW0PR7HcXR00erW75kAWn
 2iIebMjTwdKhDeeFo/LGA/tzdVP5YQtYfyasnTh4MZyA8d7zIetXosZznELO612lKhXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e0rbFj2QZFSP1e04HW49nEV/AboE08y0zDD96T8/4DE=; b=QU90m3Hp/CV/1SlmikzG5uzC85
 erTWbrKfurFQYO0AJfPVuvwoB0azCQbomPcpUnj8WJIwtO+jv/MXi9DLQV2nn9k/sH3GVM8Xht3km
 P1qXCsLpOFfrVhS80GdMDqyTVdgG4ZB/ISajMEspzmAWNZRgXZdyD1dWpNlmv9czLwA0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lEymW-003xwm-Th
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 18:21:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6DE264E6B;
 Wed, 24 Feb 2021 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1614190854;
 bh=nhrXWqf/AsZdXUVa95Ly9pNufse5xw4fS1fpiI0sHQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k0nC12vpQ3NmalV1GbiJlabOxL0csR6ual+AQzwNCHPpCQPRPJWwaMdMs2vUgwPOP
 hSwp2QGp54C1h3QeSX93YExdRaH8errHdu3z4mrhb/RW4/6tQ6GTBtELzho/WIVeym
 c5yN5JBhS1LeOZANDm/h/9ZwfP6s5kaLcQ2xeNjM=
Date: Wed, 24 Feb 2021 10:20:52 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Doug Anderson <dianders@chromium.org>
Message-Id: <20210224102052.009aaa27dd5b530d7e7ef599@linux-foundation.org>
In-Reply-To: <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
References: <20210224081652.587785-1-sumit.garg@linaro.org>
 <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lEymW-003xwm-Th
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on
 initmem after boot
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 qy15sije@cip.cs.fau.de, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 24 Feb 2021 10:09:25 -0800 Doug Anderson <dianders@chromium.org> wrote:

> On Wed, Feb 24, 2021 at 12:17 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Currently breakpoints in kernel .init.text section are not handled
> > correctly while allowing to remove them even after corresponding pages
> > have been freed.
> >
> > Fix it via killing .init.text section breakpoints just prior to initmem
> > pages being freed.
> 
> It might be worth it to mention that HW breakpoints aren't handled by
> this patch but it's probably not such a big deal.

I added that to the changelog, thanks.

I'll take your response to be the coveted acked-by :)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
