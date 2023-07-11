Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A884674E998
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Jul 2023 10:58:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qJ9CS-0001Cj-Fh
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 11 Jul 2023 08:58:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1qJ9CR-0001CU-5a
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vWBMGqIZkSokG4GAFcyx4kgjsZl3jNeZpnmtlOGdRtE=; b=VZzVG93Kn73bE0tCvu9LORrXCr
 MT6ZOVhsDbNCQ1Icc4dQQvO4cT7G0azfPp2bPRxVdVCLCotjUfI2rLG2KzYHQH97dOUIcGzTIBUQb
 PYWHFMIrJhht7bRxIszvbmnOxvYhGA6d4se576CVEPCPp5TIqtVRi9Qasz4zq8fVpo4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vWBMGqIZkSokG4GAFcyx4kgjsZl3jNeZpnmtlOGdRtE=; b=IctX/Y5XAZAy2gdul0l/AbDNR0
 zuqeggQ3FQjdrwbakxf/hDbWrpDZDOrLikpxR0rQgHZjI5qol8QII2FfM8Bit7x069wGvpeTgaQsZ
 cVrhHQNwEV3u53UURwd2HAopGH49sO3AAqM3DV2jbNxUxXRuMrwcc3FfprC5fTZ7HSvQ=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ9CS-0000zX-G4 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:58:23 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1689065894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWBMGqIZkSokG4GAFcyx4kgjsZl3jNeZpnmtlOGdRtE=;
 b=eOT0CtbyyonrY5ni/UE4lH4HbKBkE1mtF704YOYceq9sNdVDp4LyvwPBmFAntpkYUVh8Z8
 lMT8/lMu8oDT5SD8A+aQQEd7I+G7Q1qd1m6LYN3n/FM8nNfNNutS2/CpCHvoxTiFeksB5u
 uFLqJCWtsJhCf4fXmbWZAGrQ3mjgmNf1E6+1aN9Qpc5dH3H3rvzrfIqCVytQ1839JfMf41
 xZS+W9aO68DYhX2QFVtvEDy8Yag+lWFfGNzzkTHdZEmJkfrYKEXa5lAz+nLZxawWfliPMT
 sthH7y1/zPDRDVRHl7BauWRzZ7FX2PMty9VE6HtUf39pZ48Y+nv84UNgXuSFhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1689065894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWBMGqIZkSokG4GAFcyx4kgjsZl3jNeZpnmtlOGdRtE=;
 b=q+JKkH9JVmjm0uKASuFvxfxDQreaySGzSMUWUEt8zfq25lnjeGDUxdFk5QnV3FdUSZ9zy4
 daR1BmEn0DISVKCQ==
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20230711082339.GA26224@aspen.lan>
References: <20230710134524.25232-1-john.ogness@linutronix.de>
 <20230710134524.25232-2-john.ogness@linutronix.de>
 <20230711082339.GA26224@aspen.lan>
Date: Tue, 11 Jul 2023 11:04:11 +0206
Message-ID: <87lefmq0yk.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-07-11, Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > For v1 I shared an ack rather than queuing the patch. Although
 reading
 > the thread back it is possible that was based on a misunde [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qJ9CS-0000zX-G4
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 1/5] kdb: do not assume
 write() callback available
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2023-07-11, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> For v1 I shared an ack rather than queuing the patch. Although reading
> the thread back it is possible that was based on a misunderstanding
> (https://lore.kernel.org/lkml/20230309113020.GA78621@aspen.lan/ ).
>
> Anyhow, it looks like you have designed the new series to be picked
> individually?

I understood that Petr will carry the patch. Yes, this series only
includes the non-atomic/non-threaded cleanups so that it will be easier
for Petr to send the full series off to linux-next.

For this patch there is nothing left to do. I should have removed the
kdb people/lists from the mailing. Sorry about that.

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
