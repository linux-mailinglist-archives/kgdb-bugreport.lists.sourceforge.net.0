Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u9CZGrkrN2p9JwcAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 21 Jun 2026 02:09:29 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469C6A9E91
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 21 Jun 2026 02:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Zetm6fY9;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Hc3GlxOa;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=MaW8grd3;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=bombadil.20210309 header.b=C9dX86HR;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nohl0qd2dtMNoVJ4APBTNU7AD8LxVUYUDqkH3egqd8=; b=Zetm6fY95qRu0WmiOTBz13q3Ma
	i6AZfhgr6glNUU8bHaAUTz45dz9D9o3vz9EqKfi17775Jb117fSzvqZP8VTDHtIRhWgtMOIRC++Ik
	d/1N+GfFuRDHOVlMVYMWWS9M3HvIddCLrMFI1GBZjuopj/dzOm5emy9pJOJHh/kdK+DM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wb5kg-0007oz-7j
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 21 Jun 2026 00:09:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1wb5ke-0007os-1l
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 21 Jun 2026 00:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRDdqMNAqR4f0wNKFXhIHixi5hzX+BDrjwUKtKvJni0=; b=Hc3GlxOad+OhozON1LTk2KG6Li
 D3Ak0xYfazNUToegdMLxS9M3ep92ML5UY/mEk8PJMlgClCixPrTAg2EOs3ijbhBmtWOQkMPUjrsBa
 uD3hSXnD8nYrmBTnv2bz3XQlQg+PLShh3Dx/PQm0Z1LNWveRC6TXLNI5rnYMCe0ZeRnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JRDdqMNAqR4f0wNKFXhIHixi5hzX+BDrjwUKtKvJni0=; b=MaW8grd3HhXF/8RSKm90RSb0Y5
 zGm1mazNYVxaceyheNomBPEZN1+DORmGXlfM/aS6tFFXw2gpWrWWVgSaEuTGLGmyy/WqD+MV4KDfb
 FNQBJX0QPBpKpRFwv52SWzAJH1NX8x1ZkRCGzWxXEqxSB27p5/B7jgsTe4wgisugG2Rs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wb5ka-0007Lr-LD for kgdb-bugreport@lists.sourceforge.net;
 Sun, 21 Jun 2026 00:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=JRDdqMNAqR4f0wNKFXhIHixi5hzX+BDrjwUKtKvJni0=; b=C9dX86HRAuDIr4foy4iKh59/jM
 JWy+6mpBo7gtthHZMjHwKwJDLCLuibSyENbj6+he233qQfGjFMVPdu3ahaa/VCbitf0ZthU7P0QHm
 uYWwjnWFOlECqYL1NTbdqywjqK7ZxxLh5fr3JRJtyPpOhSyMeiI9OCU/9pWgMr2uwoQtjphCu7jC1
 OO7UcwtmUGE9K1CFY3jVn/BYq8AAazhsuw6PanPS8hREsp3gMKYl9DmAEGh6CCKUnuYrHFbUIG9Tw
 qBY/T4pe68XxFD+1IKOmouvZTB5luGESqef6DgOw1WBXHSKFKrg+J+OXLAu+TcxYfAaNfXrHYNMvl
 4HHnb7Og==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wb5kV-00000003eDz-21Au; Sun, 21 Jun 2026 00:09:19 +0000
Message-ID: <f23bdd14-359b-4533-b062-30d603116caa@infradead.org>
Date: Sat, 20 Jun 2026 17:09:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zenghui Yu <zenghui.yu@linux.dev>, kgdb-bugreport@lists.sourceforge.net,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260620234035.9917-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260620234035.9917-1-zenghui.yu@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/20/26 4:40 PM, Zenghui Yu wrote: > The correct path
 of driver options should be > /sys/module/<driver>/parameters/<option>. Fix
 it. > > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev> Acked-by: Randy
 Dunlap <rdunlap@infradead.org> Thanks. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wb5ka-0007Lr-LD
Subject: Re: [Kgdb-bugreport] [PATCH] docs: kgdb: Fix path of driver options
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
Cc: skhan@linuxfoundation.org, corbet@lwn.net, danielt@kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zenghui.yu@linux.dev,m:kgdb-bugreport@lists.sourceforge.net,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:danielt@kernel.org,m:jason.wessel@windriver.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,infradead.org:mid,infradead.org:from_mime,linux.dev:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1469C6A9E91



On 6/20/26 4:40 PM, Zenghui Yu wrote:
> The correct path of driver options should be
> /sys/module/<driver>/parameters/<option>. Fix it.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/process/debugging/kgdb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
> index c4d0a9121d52..316b1d74e9c8 100644
> --- a/Documentation/process/debugging/kgdb.rst
> +++ b/Documentation/process/debugging/kgdb.rst
> @@ -513,7 +513,7 @@ unregister all the kernel hook points.
>  
>  All kgdb I/O drivers can be reconfigured at run time, if
>  ``CONFIG_SYSFS`` and ``CONFIG_MODULES`` are enabled, by echo'ing a new
> -config string to ``/sys/module/<driver>/parameter/<option>``. The driver
> +config string to ``/sys/module/<driver>/parameters/<option>``. The driver
>  can be unconfigured by passing an empty string. You cannot change the
>  configuration while the debugger is attached. Make sure to detach the
>  debugger with the ``detach`` command prior to trying to unconfigure a

-- 
~Randy


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
