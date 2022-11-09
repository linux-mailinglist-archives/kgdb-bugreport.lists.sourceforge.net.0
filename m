Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E636225E8
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 09:53:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1osgqI-0004ui-1b
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 08:53:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1osgq1-0004ov-E7
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DHcT+Y2+Evz3/8OMKTYcOlVO9N2ompFadCy9jc0xdc=; b=Vq3S/CW/7W3TI7xx9KDM2fFFfs
 H6lkIqBQNg8NdygVC9AlMIXA2M15oGqVguMGboR3cwyr93akvjSUJeHBZ/D1cnHeKWugYf5X5qHLR
 3J0t1MNx1EBMjJXupdA6Tzshnv5cfIDjIkmSudLQbnlVw8h6p+mr05Ujn59dzt33NYk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0DHcT+Y2+Evz3/8OMKTYcOlVO9N2ompFadCy9jc0xdc=; b=ZggPHJv6Fncb75+oDr3a+9VfwR
 q237H2RQEWWcfM9JihcLc1EMMiODaqEhEJelJVfGVTwwN2oKunyubFFJFyWVH9Bq3f0fthHje3Xp2
 rbWL4xERUyOOyJEOVSTIBhPLPtbqXuGDbvyY658TLAiZ9ISUyxtTuYx6vU9zvEFdn2/8=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osgpy-00087U-AI for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:53:35 +0000
Received: by mail-wr1-f46.google.com with SMTP id v1so24647434wrt.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Nov 2022 00:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0DHcT+Y2+Evz3/8OMKTYcOlVO9N2ompFadCy9jc0xdc=;
 b=C1ayd+PfAXcBibE0GRYzIWMnweoIvV4AeXXNReB9Slc5N5Xfctpkdp90jTkFDuEjdb
 PxoSdZEbj3HcRPTZDnG+hfMJD8XpTS1wV5qRqp3taNSZ4zLzGbOlbXlXBNqSqAMCzrVG
 Th4SFnZ9F4Kk6H8RgjP7Lqy43B2DrNijSWfQYp4STSspdDi4UZN0AVzmVtYocSaxG0R4
 VLxw1+8td7zhBnhSxKJrW34HvrHrpdqywpyCORWKBsBI7ixbsGWrD5VJmFAF5rL5OzXM
 m6SLKgr+Zbt+JfI9/4VQD51YgFYXIXlWbP23WiYRvW7B9/1qYJGeYZDnt0uYqK7FrIc5
 W/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DHcT+Y2+Evz3/8OMKTYcOlVO9N2ompFadCy9jc0xdc=;
 b=2prBak64PdlgXODU0zy4MNChG4dV5nHqAqAlJbLcpDh+VOgM12v/9Nr0kSjagYdZrM
 +4HkBrPxgf3ylELFHpE2/KoYDYyj1kMat6GwBc8neH/4wuONZbyQafk9c2tXpEYVnvjK
 TVJrlDpOWmTQdVv2mWpb8N+gx8vxA6atKnG2kj65CZIEzfoBI16MBdVzORyjXFln93yX
 omAZbVwB+Z44dJGZBcnhfNgRwXlHfe/hYNOhHtSOxzcUYxUc1Bf+eqt+0LtcZtdDc5KG
 5vG5IQcRzV+L5q0QsXSFK88vuYcBq+kAYH7gkluPelSnO77OLjiWneIOzLHPNrbIrvWw
 97bw==
X-Gm-Message-State: ACrzQf1V9qhbak+0wpJx6HFgaJDBkLHRvOrd3G36XAJxOcmaWIDFM694
 23lxoQKknMfurvi9kiaBNhZl2Q==
X-Google-Smtp-Source: AMsMyM5w8NGS+4HLk/Hvm9+leAF0TAcvPzz63+wBmJDLaVT9nbGoxmGT+y0AiJRrHiCXNGi5PIk3+Q==
X-Received: by 2002:a5d:544b:0:b0:236:68dc:8f54 with SMTP id
 w11-20020a5d544b000000b0023668dc8f54mr35791522wrv.504.1667984007881; 
 Wed, 09 Nov 2022 00:53:27 -0800 (PST)
Received: from ash.lan ([167.98.0.196]) by smtp.gmail.com with ESMTPSA id
 z9-20020a5d6409000000b00228d67db06esm12541214wru.21.2022.11.09.00.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 00:53:27 -0800 (PST)
Date: Wed, 9 Nov 2022 08:53:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20221109085325.wiub564iqnewvczb@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-16-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-16-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:13PM +0106, John Ogness wrote:
 > Guarantee safe iteration of the console list by using SRCU. > >
 Signed-off-by:
 John Ogness <john.ogness@linutronix.de> > --- > kernel/deb [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1osgpy-00087U-AI
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 15/40] kdb: use srcu console
 list iterator
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
 Aaron Tomlin <atomlin@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 07, 2022 at 03:22:13PM +0106, John Ogness wrote:
> Guarantee safe iteration of the console list by using SRCU.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  kernel/debug/kdb/kdb_io.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 550fe8b456ec..ed8289ce4fcb 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  {
>  	struct console *c;
>  	const char *cp;
> +	int cookie;
>  	int len;
>
>  	if (msg_len == 0)
> @@ -558,7 +559,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  		cp++;
>  	}
>
> -	for_each_console(c) {
> +	/*
> +	 * The console_srcu_read_lock() only provides safe console list
> +	 * traversal. The use of the ->write() callback relies on all other
> +	 * CPUs being stopped at the moment and console drivers being able to
> +	 * handle reentrance when @oops_in_progress is set. (Note that there
> +	 * is no guarantee for either criteria.)
> +	 */

The debugger entry protocol does ensure that other CPUs are either
stopped or unresponsive. In the case where the other CPU is unresponsive
(e.g. timed out after being asked to stop) then there is a "real" printk()
issued prior to any of the above interference with the console system to
the developer driving the debugger gets as much clue as we can offer them
about what is going on (typically this is emitted from regular interrupt
context).

Given this comment is part of the debugger code then for the
oops_in_progress hack it might be more helpful to describe what
the developer in front the debugger needs to do to have the most
reliable debug session possible.

  There is no guarantee that every console drivers can handle reentrance
  in this way; the developer deploying the debugger is responsible for
  ensuring that the console drivers they have selected handle reentrance
  appropriately.


Daniel.


> +	cookie = console_srcu_read_lock();
> +	for_each_console_srcu(c) {
>  		if (!console_is_enabled(c))
>  			continue;
>  		if (c == dbg_io_ops->cons)
> @@ -577,6 +586,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  		--oops_in_progress;
>  		touch_nmi_watchdog();
>  	}
> +	console_srcu_read_unlock(cookie);
>  }
>
>  int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> --
> 2.30.2
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
