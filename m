Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GDFGi344GnZnwAAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 16:54:37 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B786740FE3F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 16:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsAUubb3MdJIbGjhc+0J5lHok90oMgEqhoBQraiyr3s=; b=ZijzrK5hgVriid9S45r0YPwMQJ
	GvHSfhBxyycCiQQWgmk9lhhCa96yDFCXQDLQPf4aR4M4JXgjwT11U9Qj8bY1Ql0tcz+o2ALiiGI/0
	BhKLvrMrgnECZS16TqgK9G/IMpfwYIapG/0vh8lLgsBQDeqTXQKB4VggWkZ7Z5ougRy4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wDO71-0006Pw-DY
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Apr 2026 14:54:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1wDO70-0006Pp-HM
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 14:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUk9+5ugjhG90uPs8bskXfY1v/H6BYvalTyZQcNSMUA=; b=KLu1db2Qv+hbu7XhZQnmFDHxgc
 hTr5EbecsRIXS2UCEZ1g1UUWKE0AbqE59kOz7fPASWFMUlj0QnUYLDAAK2g4dnXOAJ8OX6z7B5891
 RhTksKsw3kWdBSE6b+whA8gdBfTJD8FtaVEBgOmqBZzNOJC64jtTV+m2WPoBYvMl6gvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nUk9+5ugjhG90uPs8bskXfY1v/H6BYvalTyZQcNSMUA=; b=mVQrWJnkRok9uez1H/Ey2ljfXx
 H37pe9C+Dp/QgAfdMitEAssuEgTtM16zzx8/n6bLUyjlF3JlniCq0xXrT8iN5I7yJrKDmui2iCDsH
 QIQ0woiJYjcfdAzZLpTxEcBVwIonqUztwutcajkRdS6dreX0v5DrChIB/8wt63pL6kQw=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wDO6z-0004La-3V for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 14:54:34 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so85163685e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Apr 2026 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1776351266; x=1776956066; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nUk9+5ugjhG90uPs8bskXfY1v/H6BYvalTyZQcNSMUA=;
 b=Ts35IozOUo5zidHYhPkotkUbSGIokIqpc51W29NmfTJGyKiItwQ1UMha6O8xnvIwYs
 zvpzY3Q45ivLrLoInRCoPF16E8lomfaDDWGs/ljLEMilgUyzG1xjkZwL650rWp6JszbE
 Pctm21jlQqppU4HgP7f4gYoHKIoiSilnUcturdMsW5RyLpGcuAWL9KKEI1NPVh8fCTRO
 hDASzeQsDq5Ajw6xoe0LBPH/1HbLz63GXCFACSE4P681DFQmR8IHBMBDpQruAHjejZus
 br4M9JRgDVQYLOIorJ7nyvL1edPFsqvnzUd6pJBw9u5ZTyQS4WHqO8LTDkmCd78baYGR
 DJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776351266; x=1776956066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nUk9+5ugjhG90uPs8bskXfY1v/H6BYvalTyZQcNSMUA=;
 b=HuO/ngB0xc747tASul3l63fTNl+zYhIvKjM4m65IDQ9D0ZeBREFKEHnIJhh2Q7HuO0
 M9MnzNX9s6ezi3PcO7i+ToHWSZWVkUcDPbbnZeqEcaxlddlKNDnM5IqTPLJ3sRN1Tm4l
 vh+u6fdP+txEMQzPyMUISZG3Oe6vbC6xIq7TrgMBCFbJfbXZLuLEF0HbNuj4eDnsJqCu
 dAI8rXIXJU34Wh1LIdd11wnF/GsWJok4Efvg7wwRFgevi767LocfH+moHtzJnuD2jDj/
 7fhxBOu4HQ1UlgLyTjf+xeo34h06phmwGxAi/4QEcK6f7vVST6FbG6Z96RaQB2WyPUzX
 5HiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/j8BGNu0NlPDGGO2FXoUzSJJYwFeEz4L4gMDc+4De47Fzns9X/1KVLpDv8Y3UAOpuxn+rUUIYhiteTCrhseA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwdT8FjwVdect1i272WGQwA55YosFZPO+xszzKr4stTtqJ9p+L/
 E83W6UQsLhtqZ4R7ys3ggAgODretve2yXfxK8f5SjgZJlXj3kwdPhQ3hw3wo6qQ9v5o=
X-Gm-Gg: AeBDiesdmbbp+RXRnv4HrthVR+YF8jWOOZdql5zxq2DR17VO4Xuggxj0RIxL2PEMU1s
 SCLlv5JUHQQDjNZ/BJ0Tw6zK/xVke9aUe3tCFIk5NM3G6hNCRVy5nSiRy1eRhLbOrL84Ns7YFC1
 o5ACbguYDqjm/5JkgxI+LddHB7XC23yUNveV7zHcPoJwJZ4SPPfiCA/06WjyLqCrC0deyLe+gPH
 GingJpqfM8RdIfEefrMHg+OgRqqiDjLcyYuwdEtkIjWZ3rTD8+RBey/93jMke44s4eTzWLkZ2sB
 FD1A6+Wi+1MXClUfvE8pZQRmIXJ9Ti5m3/fjbF/jWcwq5me9JFMrJUqtcU3WdetIH7kfwIbb0RI
 7W5LBbhhNSzOHtrmpI0xdbrZsVuwlW5FUmiUPjvH3h943IcwjpZiXlltycBY2i39UlmOGc94O+x
 vp6UrgGSJCUMBwseLk7r9HBhBadw==
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-488d68ab2bfmr302762205e9.24.1776351266415; 
 Thu, 16 Apr 2026 07:54:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead2decafsm12915427f8f.0.2026.04.16.07.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 07:54:26 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:54:23 +0200
To: David Laight <david.laight.linux@gmail.com>
Message-ID: <aeD4H8P1DiPQoM8V@pathway.suse.cz>
References: <20260415070137.17860-1-chensong_2000@189.cn>
 <20260416133004.07bd2886@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260416133004.07bd2886@pumpkin>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2026-04-16 13:30:04, David Laight wrote: > On Wed,
 15 Apr 2026 15:01:37 +0800 > chensong_2000@189.cn wrote: > > > From: Song
 Chen <chensong_2000@189.cn> > > > > The current notifier chain imple [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
X-Headers-End: 1wDO6z-0004La-3V
Subject: Re: [Kgdb-bugreport] [RFC PATCH 1/2] kernel/notifier: replace
 single-linked list with double-linked list for reverse traversal
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
Cc: mark.rutland@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org, song@kernel.org,
 edumazet@google.com, da.gomez@kernel.org, live-patching@vger.kernel.org,
 mbenes@suse.cz, linux-clk@vger.kernel.org, agk@redhat.com,
 joe.lawrence@redhat.com, atomlin@atomlin.com, linux-acpi@vger.kernel.org,
 danielt@kernel.org, samitolvanen@google.com,
 kgdb-bugreport@lists.sourceforge.net, kuba@kernel.org, pabeni@redhat.com,
 linan122@huawei.com, lenb@kernel.org, dm-devel@lists.linux.dev,
 petr.pavlu@suse.com, paulmck@kernel.org, linux-pm@vger.kernel.org,
 frederic@kernel.org, jikos@kernel.org, snitzer@kernel.org, rostedt@goodmis.org,
 linux-raid@vger.kernel.org, mpatocka@redhat.com, yukuai@fnnas.com,
 jpoimboe@kernel.org, sboyd@kernel.org, netdev@vger.kernel.org,
 chensong_2000@189.cn, mcgrof@kernel.org, mhiramat@kernel.org, horms@kernel.org,
 jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
 bmarzins@redhat.com, linux-trace-kernel@vger.kernel.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.com:s=google];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,linaro.org,baylibre.com,vger.kernel.org,google.com,suse.cz,redhat.com,atomlin.com,lists.sourceforge.net,huawei.com,lists.linux.dev,suse.com,goodmis.org,fnnas.com,189.cn,windriver.com,efficios.com,davemloft.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kgdb-bugreport@lists.sourceforge.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.com:-];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[pmladek@suse.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pathway.suse.cz:mid,suse.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: B786740FE3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu 2026-04-16 13:30:04, David Laight wrote:
> On Wed, 15 Apr 2026 15:01:37 +0800
> chensong_2000@189.cn wrote:
> 
> > From: Song Chen <chensong_2000@189.cn>
> > 
> > The current notifier chain implementation uses a single-linked list
> > (struct notifier_block *next), which only supports forward traversal
> > in priority order. This makes it difficult to handle cleanup/teardown
> > scenarios that require notifiers to be called in reverse priority order.
> 
> If it is only cleanup/teardown then the list can be order-reversed
> as part of that process at the same time as the list is deleted.

Interesting idea. But it won't work in all situations.

Note that the motivation for this update are the module loader
notifiers which are called several times for each loaded/removed module.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
