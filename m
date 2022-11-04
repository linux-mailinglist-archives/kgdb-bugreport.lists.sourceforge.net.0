Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52C619D0F
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Nov 2022 17:23:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oqzTg-0003sa-Pt
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 04 Nov 2022 16:23:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oqzTf-0003sU-0c
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 04 Nov 2022 16:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tijLp86GZkQuYvpbkKNsoSVqaYbeBZGTP0NGWpFyyCE=; b=BRa2db5bBdoagl57MxvqYM8G8p
 mSaUM+jtyBlbcQvY1qeXlGU2pavsSA0ZeJ5aIDHnuvevXn3IHqLxShOdnLCK/1++0oytYx+w3PDkB
 CgnMvvvk+fcLZUXCN4qwY7tAFmuXBpyfmvWVT9vB/8JL741SmOq5O3dX+DIOqJD5Xxsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tijLp86GZkQuYvpbkKNsoSVqaYbeBZGTP0NGWpFyyCE=; b=QoiQoSDhpLKl9WzzAROe7BJHwL
 rkFJveyHoflgCED0YEkiCQfGM25V2jvImSgEW4uNSDgvc6x7mTH9GKXIdByEV4hHeMD/5kGxPD2qT
 pzgKNbSMlCEI3aBGku38de9eaOKxc1426vHj0hZoEPuZSpG362OYcj3tKYgRPIYVQcCQ=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqzTa-0004He-MG for kgdb-bugreport@lists.sourceforge.net;
 Fri, 04 Nov 2022 16:23:30 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667578996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tijLp86GZkQuYvpbkKNsoSVqaYbeBZGTP0NGWpFyyCE=;
 b=rhX9V8yaFwgNnlHRVbXxSHwqauTFRTjTrQL6BQ1p6vBoQS+MPSPyCmgaN+rVzZbZBMCK8l
 xo5SiNiRlO3EDC0yfxtSoi8U3Zjuu33rA+FMPViiORyfhqRC19TvEgrnEYVsKhv/m0CUrv
 7uo+pCOQcFp6C62wH+xMood/ljqOalG8ogQFvFnOEVZ/zpGls4t+rqTIIxBquItUOK8ZBn
 rgSqrlIJ74Nh5rH4KOzY24TklkQ8VxiLlwm+QOxJV/3l9cfBRUgmtn4fjiw8RxGTQc6j5P
 Lo3zjkbgBHbIxinMoz3ykEASjqzkzppFTRmxVuyv60daF7CRQtMVQwq6XOLoIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667578996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tijLp86GZkQuYvpbkKNsoSVqaYbeBZGTP0NGWpFyyCE=;
 b=03km6Xg2ZZbUKK1SCAp0bHxpHwoD19D3C1TT2XmKXk1NfLgyr78f44THYoqM/4udhMvv4f
 SinlmF6qT5x7kCDw==
To: Doug Anderson <dianders@chromium.org>
In-Reply-To: <87czagf8hf.fsf@jogness.linutronix.de>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-13-john.ogness@linutronix.de>
 <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
 <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
 <87czagf8hf.fsf@jogness.linutronix.de>
Date: Fri, 04 Nov 2022 17:29:15 +0106
Message-ID: <87bkpm7kp8.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-24, Doug Anderson <dianders@chromium.org> wrote:
 > It actually only holds console_list_lock() even at the end of the > series.
 Still, it seems weird that we're declaring the `data_race` on [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oqzTa-0004He-MG
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc:
 use console_is_enabled()
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-10-24, Doug Anderson <dianders@chromium.org> wrote:
> It actually only holds console_list_lock() even at the end of the
> series. Still, it seems weird that we're declaring the `data_race` on
> CON_ENABLED but not CON_BOOT ?

For my upcoming v3 I decided to drop this patch and will keep the
existing direct reading of @flags. Instead of this patch, for v3 the
comment will additionally mention why @flags is allowed to be directly
read:

/*
 * Hold the console_lock to guarantee that no consoles are
 * unregistered until the kgdboc_earlycon setup is complete.
 * Trapping the exit() callback relies on exit() not being
 * called until the trap is setup. This also allows safe
 * traversal of the console list and race-free reading of @flags.
 */

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
