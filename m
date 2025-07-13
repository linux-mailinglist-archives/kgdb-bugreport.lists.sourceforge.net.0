Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D6B032DF
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 13 Jul 2025 22:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bjUkafkhfvvfOab9jXJFb4HOFrUDWlPMNdhyDsUhaI=; b=eK2Z7An7OWIUGdNwEngMtXVovf
	HF1iTl0N00/mPdalBTPFqUw4vWGIbJKkwUaPSFrTRn4bZuN1yQv8DynaDMdhNtZjJKg1dJtSQmZWm
	eCGGg7yrb67BVQiIa3n2/tbBZaHP00k8Ay4ZiUPyjpcFW+yfEvgrVUkHMoyMNEjzokLM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ub38L-0004w9-Rh
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 13 Jul 2025 20:17:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ub387-0004vn-4N
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 20:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ate6Iaqw0pAtrScpzyIp0y2DFqThjFgxFwN3l+JIYI=; b=FroqYaH+fddhopPJtPXI3vGYYq
 5fEG2i6e/MXkBRuQAMONv2Zkk4HxlBFIyRz+or03bt2CYZgJU1nxsdsaL6ZvfOxoWNphleJG5mudd
 d/Y0cB94OOoWZC73WsYNxROed+3nurvCfP97zMxnAkcNTkTnIfFdJhGBVREeuvw9GsDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Ate6Iaqw0pAtrScpzyIp0y2DFqThjFgxFwN3l+JIYI=; b=bBsRVvB9Li4tBkzcX8XkmpGDZe
 0LLxQAyM24gG9am0WUSQl+tgBGM2vbk6v9QHCPxP4GInlaYhsusVfGOOif1+A8hFDRvrjyfiZa1W+
 G8mvMa0LMRWpemxlm9J93eRYxAZcCn6C36ZrvHcE9jXWsf0xq6btulA+5J0/+IDRfzqY=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ub386-0003Jr-CY for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 20:16:59 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1752437806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ate6Iaqw0pAtrScpzyIp0y2DFqThjFgxFwN3l+JIYI=;
 b=h6bKbWXnyr77glvl9ECtESpg6QcrE4KJ5GkIv1dSRedZ68Za+RK5nnuSPnyIhW53OusWVx
 UNl3O5Q3NOurKW4OSJRPieriMFOiDgC0fPBTgoRjDQQIdDUqCpLOvbuvOp0q0AYvGh8Onw
 FWQ8O5wOjB743j0g6fO+FRL5aqiRcPlbDG4O4glP+6vhekAo4KSX+MiDmY10eAYxxY3zdG
 8uMPHr4s8vECIJg3th46LolYtKX5SmHtpwWnWZNA3+joJNd+ybsIJxhffpeK955j9u+thD
 bXhHI5Gq0Obn5hBMEJjmNoWXCN7FmC7/pSOb0B4Bn/JV9AC/pU+l6VBITL/1UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1752437806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ate6Iaqw0pAtrScpzyIp0y2DFqThjFgxFwN3l+JIYI=;
 b=2tX286yDJw+xbE+CcML+gTJIlbG6qab9hkNcXmDHNmdKL8n3uYYEEWMW1iNxwlUg++/kNO
 dcv3xuiokrak8QAg==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
References: <20250713-nbcon-kgdboc-v1-0-51eccd9247a8@suse.com>
 <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
Date: Sun, 13 Jul 2025 22:22:45 +0206
Message-ID: <84o6tnx2vm.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-07-13, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > Function nbcon_context_try_acquire,
 nbcon_context_relase and > console_is_usable
 are going to be used in the next patch. The nbcon_context is supposed is
 not meant to be exposed like this. I would prefer creating a proper interface
 rather than having kdb code directly modifying internal structures. I will
 provide more d [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1ub386-0003Jr-CY
Subject: Re: [Kgdb-bugreport] [PATCH 1/2] printk: nbcon: Export
 console_is_usage and other nbcon symbols
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Marcos Paulo de Souza <mpdesouza@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-07-13, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> Function nbcon_context_try_acquire, nbcon_context_relase and
> console_is_usable are going to be used in the next patch.

The nbcon_context is supposed is not meant to be exposed like this. I
would prefer creating a proper interface rather than having kdb code
directly modifying internal structures. I will provide more details in
the response to the 2nd patch of this series.

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
