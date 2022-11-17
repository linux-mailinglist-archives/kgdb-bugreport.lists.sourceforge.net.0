Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310162D7A2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 11:00:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovbhZ-0005S5-Rd
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 10:00:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovbhX-0005Rx-0i
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 10:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=maOat5H9gR3gEndNJY08JL9PAhjiKE0EY6OpaWP1/04=; b=W+dFpvpJ0mdS7cFPQ8nKirp1EG
 L7N2CJKxg4huzp8cTq9NNnU5Gk0ghp8NKkz4+2A5/vv9NjMhakCl30fILDb2Noia7eN4/XzOZa5v/
 rK1IOuoDenWpK3U0XhPhIHZOgztZe7XaaNrAW2KIslPLYkcrg5hbZzFQ5G6XiWbuyGH0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=maOat5H9gR3gEndNJY08JL9PAhjiKE0EY6OpaWP1/04=; b=RZOpQjkaOGNa3MtHtAW/bTQvUv
 JKt1cXAha+a2in/5VklwpmmnfgdmtTkdAJKjiASH4MCtABBWUtUExT/TDhXlZ9KkKc7n1yVP0Rxro
 OnrbjfrD6/2BTFiL0+1Iru/VqA7BfCOIVwR6QPjPKl+F/mRHoGf0dPozHmrxH1G5Nu50=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovbhV-000746-Sk for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 10:00:54 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668679244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=maOat5H9gR3gEndNJY08JL9PAhjiKE0EY6OpaWP1/04=;
 b=RGSf5GbhYCWO2dgXgAK/4MemOTdiWzdlP2kHg1EY3iV82/jd6MD8qutFDOfZyP9AVki+J/
 RJ3tnnq6qLSJqqLRr72tXKSu30sMmZ40MFaLZbHPv5iVTEioxdnQWXBGw2O5N8hagYae8C
 eCB4colyFEdiZ5ue+ppMaKiDDXUTmIYbgrfRYPfZIInqUaDu9aBDcjuxngxWMw2cLoyVmy
 YQbMsvPmhg8jJHFTlEbypw0KgTemn+F6bHK3dPe+RmIxFbhPe/VOto2MlBZj9l2nBJZypQ
 8POBvrR40jv9J1kVauY3ttDgvETw6SrqQHB+svEGkXwXN5pZ5ACVmn4odhHzLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668679244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=maOat5H9gR3gEndNJY08JL9PAhjiKE0EY6OpaWP1/04=;
 b=OlNG+d1h/dgED4we7sPNyAacUdRGHP68b+yrWn7eSaSHsibUbUaAIusgf57rSNw5GtbQqm
 6kHebCFDUDCB26Bw==
To: Doug Anderson <dianders@chromium.org>
In-Reply-To: <CAD=FV=WWZAAhw7rWjCvtqz6VGh-PzG_zMnugX_KkG7gZ+a9Qpw@mail.gmail.com>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-38-john.ogness@linutronix.de>
 <CAD=FV=WWZAAhw7rWjCvtqz6VGh-PzG_zMnugX_KkG7gZ+a9Qpw@mail.gmail.com>
Date: Thu, 17 Nov 2022 11:06:40 +0106
Message-ID: <87pmdloq7r.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-11-16, Doug Anderson <dianders@chromium.org> wrote:
 > Seems OK to me, though I guess I would have moved console_lock() up > too
 just because this isn't a case we need to optimize and then we c [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovbhV-000746-Sk
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 37/40] tty: serial: kgdboc:
 synchronize tty_find_polling_driver() and register_console()
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

On 2022-11-16, Doug Anderson <dianders@chromium.org> wrote:
> Seems OK to me, though I guess I would have moved console_lock() up
> too just because this isn't a case we need to optimize and then we can
> be extra certain that nobody else is messing with console structures
> while we're looking at them.

Actually this series is not about optimization. It is about reducing the
scope of console_lock and removing unnecessary use of it.

If tty_find_polling_driver() needs to be called under the console_lock,
then we need to document exactly why. I could not find any situations
where it is necessary.

Also keep in mind that in the long term we will be completely removing
the console_lock. It is a painful process of identifying and dismantling
its scope and replacing it with multiple clearly scoped locking
mechanisms.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
