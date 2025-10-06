Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47604BBD5B4
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 06 Oct 2025 10:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEeYFnWc026UxuZQ7AmURRpLlPbBFA41VF2WuEsIafw=; b=WD3olltdB1JRsscDAUWqcGJ/Rm
	4nBqSgQkuzBfSP9XQLwC3KD7pKQPW37zatSRw/pFjFEI9BuSLwbWl3NmUNRYicv9MEGnNrpHLIwYZ
	xwusFL4Z+wKI/+lsceOVQKJw7b2peH04mox2onMDwGusWUerqgAHeCEzmjvQOlu4Km/8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v5gcy-0006bU-MV
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 06 Oct 2025 08:31:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1v5gcx-0006bO-9s
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 06 Oct 2025 08:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/bDKBKLqO8NLLmrLZz1pQqgzcrI+/whlYpUwPEG7xYc=; b=h55BFragza0kMPMjFWKyoQUMDC
 u6HX8ELJ37cMB2ICN9kbnpgxUIZVfj6U2ysS3DXC9Wmo1lyMW6b4BlshCh95r2Wh0ys2+O3PcBQYB
 Ge14ibS8t9UNTLqi0lWvNj/3iaKX5uw/zCP+wiFHqau9xUOfhOFr1HUhTJdSljZBmgJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/bDKBKLqO8NLLmrLZz1pQqgzcrI+/whlYpUwPEG7xYc=; b=ivv2hq7GQG4AKiEr/i+s6edDO2
 USvSoI6HMPdaQKXi8HXmprEzmkfmOYA+pXIYARIXU1AtAEG7u1vMqmsInO3VTNVEKTLQ8i7+e3qE7
 Iv6iH9SrvatQQFVC7OAQTb9zw7CBtg7mwBDNRGVaj6rlaeW1r1McmPax+7tZ26cEypwc=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v5gcw-00061J-K0 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 06 Oct 2025 08:31:27 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1759739479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/bDKBKLqO8NLLmrLZz1pQqgzcrI+/whlYpUwPEG7xYc=;
 b=PkrAlUwsg3dAdcz7ZJt2rLm0NbtZq/Hfl5ccwLle/DhAs7+lM2dqZETNVguisKqU8lWZvX
 /74c1Yo0aP710U+DZ6TKV5jPzyq6qETpeU0NcUt6RGfvafP9RO6cnmsojv7VF/gRklEZz8
 iNlh9Ydinw9W09RhEiW+g/YqvlMg0fXul6bY4Vy2S2T3JdtlS4BHnB392bf8NmI9sXI0rr
 95ptSuMqvG8duLnOuorBJ2C3CviyQ9cUoTDd1+Y63Znb4SSdaFlcelzE3QFc8xqbOZdu38
 ppM3rya8WgjQKAJjuSsUYWUw5HKwgut5HWVvTHU3jXEi8K5WnES1OvICuRjExQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1759739479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/bDKBKLqO8NLLmrLZz1pQqgzcrI+/whlYpUwPEG7xYc=;
 b=nKFtt9dEDGUiFSq27YMWNJ6yeTpuuhokEvNbP76nfHSafx6+y8A/s/tCqNKr7fyOpM7UYg
 NdUON0cC8SxszVBA==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <68f9b7d000ec433adef02294552280902590f762.camel@suse.com>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-2-8125893cfb4f@suse.com>
 <84h5wihdqu.fsf@jogness.linutronix.de>
 <68f9b7d000ec433adef02294552280902590f762.camel@suse.com>
Date: Mon, 06 Oct 2025 10:37:18 +0206
Message-ID: <84y0pomnxl.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-10-02, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > I fixed all your suggestions and published my branch here[1]. The
 only > change that I didn't fixed was about the "Context:" change t [...]
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1v5gcw-00061J-K0
Subject: Re: [Kgdb-bugreport] [PATCH v5 2/5] printk: nbcon: Introduce KDB
 helpers
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-10-02, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> I fixed all your suggestions and published my branch here[1]. The only
> change that I didn't fixed was about the "Context:" change that you
> suggested, since I'll let Petr to thing about it, since he usually has
> comments about it.
>
> [1]: https://github.com/marcosps/linux/tree/nbcon-kgdboc-v5

Thanks. For v6 you can add:

Reviewed-by: John Ogness <john.ogness@linutronix.de>

for the rest of the series (patches 1-4).

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
