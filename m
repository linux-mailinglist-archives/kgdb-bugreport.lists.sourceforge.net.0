Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE65669302
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jan 2023 10:33:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pGGRB-0002F4-Oh
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jan 2023 09:33:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1pGGR9-0002Ex-SY
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 09:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zvgzUZVNOsJhrqogIQbaF7fQVkfnjfGBZPgEF4xaofg=; b=RxxYeWNxOPFB/ZPG949kYx2ZYo
 nRuA/jfYBkCbsn91x0PY3htMhxKzhVu7PxplYdC7MhE/HRHVSZGQDenxU/MjS5O62Uj+H28Ep8QX9
 67LTNOC/N+FXqNz0s+WRNgZDCIWz5czjz9usUAqbc6vwacV3K5FSVYFcRpwNDkjJ36DI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zvgzUZVNOsJhrqogIQbaF7fQVkfnjfGBZPgEF4xaofg=; b=XcaQ2OwDBMtw+sjD4/jLYIpyEJ
 JzeeG2mrZIrSqCSenwn/iYiOWh8RYMPsilqO3Oh04nuWbqZfcoRfXX1N6f4eFltysHMe1O1RDjwwl
 uPnBhzIzq8AmHXMTbEr0uE0lr2Vmtb24eUaVjsBzKi4wp/X8clpU4rtwdv8w/HUmeAeA=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pGGR4-0004Ky-Bh for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 09:33:22 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1673602391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zvgzUZVNOsJhrqogIQbaF7fQVkfnjfGBZPgEF4xaofg=;
 b=Fvr6S+TAOcieooMZX85FljvZhT4t7vYP9xck6nG2qMhv8sqQqKAWjfo35vgJLOQcVGFglm
 cazR8mUlO3qXlW7UOdsOrXwXVclqWKS62fF0lI8cQAW7QLBVvP0fyU9pTHIkZUryqly9XK
 cb6PaObMXSyo3X7cTmtRf9YL825S28NcO36nYs1Twio8A8e7rzoCQWmMZ6y6GnHeVoux65
 1Cu7NJ8BRGCTY7nfnOasdxc3n9BXSw4RFsjYwid8oJWNgd2SP0bA9Lj82fE1LJVlhk3F2J
 o39gTHznmEz2VWbLDGypw3HCyaTKPH/TNTjG0Ijzx0duQ5pz4oFZs8694xxzWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1673602391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zvgzUZVNOsJhrqogIQbaF7fQVkfnjfGBZPgEF4xaofg=;
 b=iglIjw7zXlYGoZfbluYCITvytDBZK7rl6BH8l1Ibpx4tcr7SfY5rRccDR8Xh64R3TB3jaD
 FY3ZD1JQZz7aoPDw==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <Y8Eg1wDOOkSCAh2E@alley>
References: <20230112161213.1434854-1-john.ogness@linutronix.de>
 <Y8Eg1wDOOkSCAh2E@alley>
Date: Fri, 13 Jan 2023 10:38:24 +0106
Message-ID: <87r0vypyon.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-01-13, Petr Mladek <pmladek@suse.com> wrote: > JFYI, 
 the patch has been committed into printk/linux.git,
 > branch rework/console-list-lock.
 Thanks! > I am going to give it few days in linux-next. If there is no problem
 > I will send a pull request for 6.2-rc5 later the following week. 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pGGR4-0004Ky-Bh
Subject: Re: [Kgdb-bugreport] [PATCH v2] tty: serial: kgdboc: fix mutex
 locking order for configure_kgdboc()
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2023-01-13, Petr Mladek <pmladek@suse.com> wrote:
> JFYI, the patch has been committed into printk/linux.git,
> branch rework/console-list-lock.

Thanks!

> I am going to give it few days in linux-next. If there is no problem
> I will send a pull request for 6.2-rc5 later the following week.

Sounds good to me. For the 6.2 pull request, please also add Sergey's
reviewed-by tag.

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
