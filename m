Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3DE6B21E3
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 Mar 2023 11:53:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1paDtL-0001L6-LU
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 09 Mar 2023 10:53:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1paDtG-0001Ki-DR
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 10:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NDH8OLZkH1zNeGUVE0PPzxXRqdEYd+lesm/7IX7WPhI=; b=dTBzee0EZ3Mi8YMg7xcX1Vn/yb
 dYaAeOanZQt32LbFwJ7p8mW/yo6ej+olXe7n31i5hs3zE7x/EN5XsxI3GOmJLeBAdSC+3b1UNdgnD
 SyPB57EPr1Ff6OKzqlXtNiXBdI4jTJIbncBNIHnBU1QPWxnpiKYlYP6wp7Rwp3AjqwHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NDH8OLZkH1zNeGUVE0PPzxXRqdEYd+lesm/7IX7WPhI=; b=nRDkoCB1uxCTfRaE2i2Fyo8MN6
 3lX3LZ7xnQQ+5FftLSBcM0/x8LlBuWU41ABU/PcdhR0VC2YkXk8+cjLw6uU3bCBm7YJZKRhRED1Pb
 pL7VD7TKknQ7zuYby55dtSR5bh4aFPSaf6fZxgQxOy9TknwukkXUFiMtWHsshyCEw+gE=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1paDtC-0001IT-Kk for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 10:52:54 +0000
Received: by mail-ed1-f42.google.com with SMTP id ay14so5148454edb.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 09 Mar 2023 02:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678359163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NDH8OLZkH1zNeGUVE0PPzxXRqdEYd+lesm/7IX7WPhI=;
 b=yPwsLrbpELTrhmevcCA4PI51KtnJnIBb3ne276/2e8BjzHhjy/E+S8mI/gn7P+R3zW
 //lIpdqXC1SLLcpCuZ08CV6KIDbcFlJqhW70U6n0/b94mIA4lXE4malCs4DSeV5XlEuL
 AXJ15p6Sr+I+nbNxfyv2sOKC9M5uTNEYPxq+/+58LqbtH+t8sA4hCUSoqs0tsQSdxZfC
 oYfN5qzNHzx5JQ+4DM/IYw+vFCXHtiaggT7eTlQLDwqgyeM8xiJGOLcamZXK27T8gu3S
 VeA6x8USN/XgD2CY6EBGEA3rKggob8W+pmfbrNwzL1pYOoITtWlsgS+Z+uGEouLuFqRC
 /J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678359163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDH8OLZkH1zNeGUVE0PPzxXRqdEYd+lesm/7IX7WPhI=;
 b=whC+6CAQqfzSEmJbwIE0ZLdvr+j+HHYqk3NGfOvCEPa979CHcct9pwGOu1+E/Y2mGO
 TS9rc9SlSfi6dtlJFpjMBERPebiuEr9FfOnDnNiMBwMG0s6KQyWg9+yljNT6fSFpZyl9
 6reYXtTsq3N6HRr/0ey5duGtOYoOGePocq64AvIpxGD0NWBLqjXLLtHxlAxBcN3ixCph
 Xj9sP0Q9pKOuXJx0kVsCpH9Dmpx6Enj2QIzsy+1avqasyRNSaGqFZ7dhwIvonr5UwUQC
 ZpRkdTv/y5XY+VwJ3bSHI3g6tNpy4uPvRn1HE72GErPa6NcniFkim2M0ZEatlIZbjlvP
 2P/A==
X-Gm-Message-State: AO0yUKXAL1F7oIHrfMYIiZWkDN0Xesa8kNK2R4JSR0vIR5mo1qhKKYbX
 dCJ99YOjtjJcpJy7VJzIA2y/wQ==
X-Google-Smtp-Source: AK7set+iTDjQGgE05HYqYyDd5tphuWtkw3KokPYqWDwo7oXDYpNFrmhxjp5ck/aH23b5Thpe8vg8gw==
X-Received: by 2002:a17:906:11c6:b0:8b1:3191:286f with SMTP id
 o6-20020a17090611c600b008b13191286fmr19533233eja.25.1678359163235; 
 Thu, 09 Mar 2023 02:52:43 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 dt2-20020a170906b78200b008dcf89a72d7sm8823028ejb.147.2023.03.09.02.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 02:52:42 -0800 (PST)
Date: Thu, 9 Mar 2023 10:52:40 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20230309105240.GA83039@aspen.lan>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <20230302195618.156940-2-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302195618.156940-2-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 02, 2023 at 09:02:01PM +0106, John Ogness wrote:
 > It is allowed for consoles to provide no write() callback. For > example
 ttynull does this. > > Check if a write() callback is available [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1paDtC-0001IT-Kk
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 01/18] kdb: do not assume
 write() callback available
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

On Thu, Mar 02, 2023 at 09:02:01PM +0106, John Ogness wrote:
> It is allowed for consoles to provide no write() callback. For
> example ttynull does this.
>
> Check if a write() callback is available before using it.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Any thoughts on best way to land the series. All via one tree or can
we pick and mix?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
