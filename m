Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D353B612
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Jun 2019 15:33:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1haKQm-0002d9-Pk
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 Jun 2019 13:33:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1hYnJ7-0003wZ-7I
 for kgdb-bugreport@lists.sourceforge.net; Thu, 06 Jun 2019 07:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z/8oyk9uNrPJxZlXwrHtU2QtgpaYKyA7xlM+h/463ok=; b=ZfvwHw+B0xVvDFldIuiAKlr0Eu
 OruFhYXGX/PD8V5B7Rgp6B3lzvAIx9LR8Kf3g+ziwSxJskIAjqrViKKpNEvonMjRl7K69nwvGvDGp
 87Al3ex/PkRqO6suDOLqhK/nk7hKgEE5yyf0zevHdEoYLQBWVhyVBoN6vgObLSQ+jI2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z/8oyk9uNrPJxZlXwrHtU2QtgpaYKyA7xlM+h/463ok=; b=nAVvwV9lYDlW9BbE/IUjedIVIQ
 Y9kkaMoDqDBWadKKslTAVJ8rb3iYtRv+88FJyqZjQOeXOUzBSf+JT8o14Ii+07m/HKPmOFtSTKiE5
 az4xBZScLRgzTAG0lppzD2rtdCquZA5esE/kzhvtMQCkBTKtaXZx9Ew/OMd3jArc4vrg=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hYnJ5-0042hS-2b
 for kgdb-bugreport@lists.sourceforge.net; Thu, 06 Jun 2019 07:59:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36976AF9A;
 Thu,  6 Jun 2019 07:59:24 +0000 (UTC)
Date: Thu, 6 Jun 2019 09:59:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <20190606075923.suhcxfu7yprhdp7i@pathway.suse.cz>
References: <20190528002412.1625-1-dima@arista.com>
 <20190528041500.GB26865@jagdpanzerIV>
 <20190528044619.GA3429@jagdpanzerIV>
 <20190528134227.xyb3622gjwu52q4r@pathway.suse.cz>
 <82605abd-14d9-376a-446c-48475ae305dc@i-love.sakura.ne.jp>
 <c265f674-e293-332b-a037-895025354a69@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c265f674-e293-332b-a037-895025354a69@i-love.sakura.ne.jp>
User-Agent: NeoMutt/20170912 (1.9.0)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hYnJ5-0042hS-2b
X-Mailman-Approved-At: Mon, 10 Jun 2019 13:33:47 +0000
Subject: Re: [Kgdb-bugreport] [RFC] printk: Introduce per context console
 loglevel.
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
Cc: linux-ia64@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Dmitry Safonov <dima@arista.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sun 2019-06-02 15:13:35, Tetsuo Handa wrote:
> Dmitry Safonov proposed KERN_UNSUPPRESSED loglevel which pretends as if
> ignore_loglevel was specified for per printk() basis, for we can fail to
> apply temporarily manipulated console loglevel because console loglevel
> is evaluated when the message is printed to consoles rather than when
> the message is stored into the buffer [1].
> 
> Temporary manipulation of console loglevel for SysRq is applied to only
> the header line.

We should ask why this this is handled this way.

My understanding is to give user feedback that something is going
to happen when the system is not responsive and sysrq is the last
chance to get some information, sync, and reboot.

Maybe, it is not needed these days when the console loglevel
might be manipulated by sysrq as well.

> At first I though that we also want to apply temporary
> manipulation of console loglevel for SysRq to the body lines, for showing
> only the header line is hardly helpful. But I realized that we should not
> force showing the body lines because some users might be triggering SysRq
>  from /proc and reading via syslog rather than via console output. Users
> who need to read via console output should be able to manipulate console
> loglevel by triggering SysRq from console.

Sounds reasonable.

> Since we currently defer storing of the messages from NMI context and
> recursive context, we would need to explicitly pass KERN_UNSUPPRESSED.
> But Sergey Senozhatsky thinks that it might be fine to automatically
> apply KERN_UNSUPPRESSED to printk() from NMI context and recursive
> context, for messages from these contexts are likely important [2].

I do not agree with this. Nobody cared about printk() deadlocks in NMI
for a long time. The idea was that people just should not print
anything there.

Reality shown that people just printed from this context and we needed
to make printk() safe there.

IMHO, expecting that all messages in NMI context are super important
is a similar mistake.

Also sysrq-l prints all backtraces from NMI context. It is huge
amount of output. People might want just store it into the logbuffer.
It is the same as with sysrq-t mentioned above.

> Then, we could avoid explicitly passing KERN_UNSUPPRESSED, by introducing
> per context console loglevel.
> 
> This patch introduces per CPU console loglevel (for in_nmi(), in_irq() and
> in_serving_softirq()) and per thread console loglevel (for in_task()), and
> replaces temporary manipulation of global console_loglevel with temporary
> manipulation of per context console_loglevel based on an assumption that
> users who are temporarily manipulating global console_loglevel needs to
> apply it to only current context. (Note that triggering SysRq-t from /proc
> runs in in_task() context, and it should not disable preemption because it
> may take long period. Thus, per thread console loglevel is used.)

This is too generic and complicated.

Only the single pr_info() in __handle_sysrq() seems to be called with
interrupts enabled. And it happens only when it is triggered via
/proc/sysrq-trigger. Manipulating the console loglevel is
questionable there.

Using the existing printk_context is good enough.

Also the final output is either LOG_ALWAYS_CON or LOG_NEVER_CON.
The API should not pretend that it supports any loglevel granularity.

If we end up with the two states, the API should consist of three
functions, e.g.

   int set_console_verbose(unsigned long *flags);
   int set_console_quiet(unsigned long *flags);
   restore_console_loglevel(int loglevel, unsigned long flags);

Where the first two functions should return the original loglevel
and irqflags.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
