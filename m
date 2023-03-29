Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E456CD3F3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Mar 2023 10:04:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1phQnZ-00081U-Au
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 29 Mar 2023 08:04:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1phQmg-0007lF-E0
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Mar 2023 08:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ICn2IUeBEefhWUnrVwwgjW98U4BhJgsWujMRsb5uiew=; b=DBXdgItRIUPjcSauPctDV/JQL7
 6hfpY5tCsPlDN00itGVCtzswXt2KCLe77s7eGZbuagn30fCs513etcVXxOUQvJdWabxKdkdi/6OJ7
 1bJRjt1KpaI1TFtGgpRQzsPSb2/w++XpbDGlelACvYQC7yxCAnUMCVXjY09PWpUFd/Rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ICn2IUeBEefhWUnrVwwgjW98U4BhJgsWujMRsb5uiew=; b=jd3XYDPadCzShG1k6tKhE+/A+l
 V3hcCQ7g8PFy//lSV3Uk9/5RAaH1ZH62SfydHKKcH+N6DQnekK1NMAAhy+mUmlBtPEHMB9k2Yg32K
 GopdON6AqF8g13O4kXvLlUEvfLrnJWIDdxqoZQ8aztMBH8VT5QlKuR7UGksI0N6SlmA4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1phQmb-0002xv-Kv for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Mar 2023 08:03:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7F852219E7;
 Wed, 29 Mar 2023 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1680077018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICn2IUeBEefhWUnrVwwgjW98U4BhJgsWujMRsb5uiew=;
 b=FJS+18HMODTwNmHvvxxOJaelViHM+6afdk9Pgzu6vt4DkahdE6qeAZmAS2mImejCjWuCod
 pTjIstQ62m9cov9oi8oweZjZvdtEDYtmSxnvHBCOYsAua1FNyY8AJlOgQhvCm5e1mw8hV9
 oNbWsqoqiejrQuKT5r84TeQdZ9c2enk=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E98FB2C141;
 Wed, 29 Mar 2023 08:03:36 +0000 (UTC)
Date: Wed, 29 Mar 2023 10:03:34 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <ZCPw1pEakE7SGsKg@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <87wn3zsz5x.fsf@jogness.linutronix.de> <ZCLsuln0nHr7S9a5@alley>
 <87a5zxger3.fsf@jogness.linutronix.de> <ZCMDVKy1Ir0rvi5g@alley>
 <87ilekmtuj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ilekmtuj.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2023-03-28 23:53:16,
 John Ogness wrote: > On 2023-03-28, 
 Petr Mladek <pmladek@suse.com> wrote: > >> If an atomic context loses
 ownership
 while doing certain activities, > >> it may need to re-a [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1phQmb-0002xv-Kv
Subject: Re: [Kgdb-bugreport] locking API: was: [PATCH printk v1 00/18]
 serial: 8250: implement non-BKL console
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 rcu@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, tangmeng <tangmeng@uniontech.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2023-03-28 23:53:16, John Ogness wrote:
> On 2023-03-28, Petr Mladek <pmladek@suse.com> wrote:
> >> If an atomic context loses ownership while doing certain activities,
> >> it may need to re-acquire ownership in order to finish or cleanup
> >> what it started.
> >
> > This sounds suspicious. If a console/writer context has lost the lock
> > then all shared/locked resources might already be used by the new
> > owner.
> 
> Correct.
> 
> > I would expect that the context could touch only non-shared resources
> > after loosing the lock.
> 
> Correct.
> 
> The 8250 driver must disable interrupts before writing to the TX
> FIFO. After writing it re-enables the interrupts. However, it might be
> the case that the interrupts were already disabled, in which case after
> writing they are left disabled.

I see. The reacquire() makes sense now.

Thanks a lot for explanation.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
