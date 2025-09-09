Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3C5B4FF45
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 16:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3S+4YNfEg4xhkEbWaaIn8FLoesR7ji8Y7FPSg77Pmg=; b=KLDfHlDJ+oHqh+WbNMhN2YyNsQ
	JeitZwqGq02vyFGrkjH3/qpdGjoE/Ak8UD4aZdCi/Td5BdWRs6uqtcoizG6cpCidJOZ3Q0FjuseZQ
	nc4UdFdcBbYgvfHfCkwePk6SPU1iSlCey5oCLOIz5mbqx8koSAgU2OrJv/+9A47N6q8I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvzGL-00028p-NI
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 14:24:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uvzGK-00028V-1k
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 14:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M5svAHzkipeo6JblunyqQxlNE3zvU2z9UULrfqp3VrA=; b=HFe5oVV1V5Bb4gOzo73tBYqSS3
 +oSdk1c13kwx5I4py1dLyXiPeTusUDbS/0cpYHn+nx2Rvt5pkHiwodbq7nZ5+bS00RWRIRX52PRhG
 Q92zPUXfdCLaxUmWl/XhfrERtL9vxuX9kBmf1CY/ZLGpFAx5zJFVw9R8RqObBp5a+ZQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M5svAHzkipeo6JblunyqQxlNE3zvU2z9UULrfqp3VrA=; b=MCloTI837j1bW5pr4+XNPZWAiz
 J8SmsHWBZTNSntIF3WYnCBAhGkBJLj4DliAt9uQC4vtVElv6pZMnngycQnRlMNO0dQIxInZGISiJW
 uRVGSPxj54AISStju0ozeZexN0pgYKO8VaZXo9AQGMo0l+dAMM7kZiMICiRtBska4JsU=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvzGK-00038n-7t for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 14:24:00 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1757427831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M5svAHzkipeo6JblunyqQxlNE3zvU2z9UULrfqp3VrA=;
 b=oJcGfFr1rksMzLrazCvGv06Z9ENMD7YoYPf/ZmgTE7wLZo2vYifaG0hiue8LE5jWcXkeOW
 8f2QOArwzb1/Mgi+5iloPynO1/BTHZ78ga1ud5Vyt/hG8s1JAVrkCk7PUrLhSOLitwFAhf
 eMaxlALJD5gobhYRFQPYKrG7dz4siXDoPASGyC9P/ZJCccPNxy6LNA9z2C3nwrEEFXiQsA
 5DPZZ0hYO/6YUjgCR7/3YyV8BhINlFosiAKg/GKlY8FdMk6FU72ttjr8puQoMg3u3OHBWt
 MPtjbC8g9v4bMnqGStylHR7UMm/4Lxo5JRam/+/vtJRqeofIF/S8x/8H+0etFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1757427831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M5svAHzkipeo6JblunyqQxlNE3zvU2z9UULrfqp3VrA=;
 b=s2ddDEaTcNXlPd99azukgVLOZVpiBp1MrlrZfj5tbC9Ti6XWSHKJK55ZnN+TPJeHXW2yaj
 QWL9JyvHuPAJHBCA==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aMAwMz4vWC5u9OpN@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-4-cd30a8106f1c@suse.com>
 <aL77aq4gZBsn4epT@pathway.suse.cz>
 <d73e8cc0259c140a0a49f670c6c165bb662281ed.camel@suse.com>
 <84segwjbxq.fsf@jogness.linutronix.de> <aMAwMz4vWC5u9OpN@pathway.suse.cz>
Date: Tue, 09 Sep 2025 16:29:50 +0206
Message-ID: <84h5xbk8ll.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-09, Petr Mladek <pmladek@suse.com> wrote: > The
 problem is that wctxt->unsafe_takeover would need to get updated > after
 acquiring the context. And might be reused for different > consoles, [...]
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
X-Headers-End: 1uvzGK-00038n-7t
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-09, Petr Mladek <pmladek@suse.com> wrote:
> The problem is that wctxt->unsafe_takeover would need to get updated
> after acquiring the context. And might be reused for different
> consoles, ...

You are right. I think it is best to make nbcon_write_context_set_buf()
available.

> But wait. I do not see any code using wctxt->unsafe_takeover.
>
> It seems that the motivation was that console drivers might
> do something else when there was an unsafe_takeover in the past,
> see https://lore.kernel.org/lkml/87cyz6ro62.fsf@jogness.linutronix.de/
> But it seems that no console driver is using it.
>
> So, I would prefer to remove the "unsafe_takeover" field from
> struct nbcon_write_context and keep this kdb code as it is now.

No one is using it because the nbcon drivers are still implementing the
"hope and pray" model on unsafe takeovers. The flag is an important part
of the API to allow drivers to maximize their safety.

I think it is too early to remove the flag when there are still so few
nbcon drivers in existance.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
