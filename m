Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A026B21FB
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 Mar 2023 11:56:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1paDwK-0001kD-O8
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 09 Mar 2023 10:56:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1paDwB-0001iO-At
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 10:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3WJfEb92xt22bfFrUgoL1/wj4gfJmjIX6QMBtki11E=; b=AewQszJ6P5L0cBkPMDNnURFhOO
 9225Yn+Kw3mJ7Y3DTdFTbUEL9c+u9CDfsPXs02OJhYG+cGMOXPFrLVroXN7blYyiSnf9MS4ET3wU+
 mcSlJPa421EIpVYJc6vIlPOpRvkCzjsyyVQ4ZQ+ocSWXYqRAo97C1RyBAp2y1bFbhrpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d3WJfEb92xt22bfFrUgoL1/wj4gfJmjIX6QMBtki11E=; b=Fed/mHfAlpJUBJA2a6G0pfL7P8
 3l3GW/NW6TDc1uHLkwuf3w166Wn1HxZOKf8m8xQ2MITo1hrhlNgRGz6sI9+yVOudQc4M50oatRlw2
 ueutSWQrHJr2P7N981JjbFSEyJeO2v704sl94sjjbrvwuwLcyWL6e1c9qB8/DRlx+AD8=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1paDw9-0001T9-F5 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 10:55:54 +0000
Received: by mail-ed1-f45.google.com with SMTP id o12so5207575edb.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 09 Mar 2023 02:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678359343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d3WJfEb92xt22bfFrUgoL1/wj4gfJmjIX6QMBtki11E=;
 b=TwTMzP6pzXfLRsTYKHz1AfNCtBnZG1xs35LMAeJpVLdRxg66JtnQoc8BgMlZl4AJ5u
 5Fqv95xgP4iXrp2U3rLknE0hmRVWN8dxqsl+zAut0Af08QfMzLcikpS6rh6JtUN2ojIP
 hXuIMCF5dwD3EjuRWEnr98FfedfF77XY7MMO046T4sEZr1+4Rw+TAYyFV4Cybr9Vm6QH
 3rXD4MiDZMQfE1n339YIwvXzyBMy51+QIgXa+h0FYP3DM3WE47HlK3dWtktft7URXMAj
 OIywN8sSp+3c1bWjpyyYHCva762GKeQcUTxZUi8+WgkW5cyoxMR4LwQinoLFIQ/iLcL3
 P0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678359343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3WJfEb92xt22bfFrUgoL1/wj4gfJmjIX6QMBtki11E=;
 b=eL2jBk7G8YQQng9/s2psZU5WH/oa4y4LARlUD/YFldxwdgLKX464o0exj3lJEOS0OG
 WjL6NCgRSatfIHO926ASmTIVlNycfy9228FqhE4AXMIfL9sc5amHnI/JHfdAppUa5l5t
 FTZcjXUmaKdEGp2VseXiRqNAixRz2YuV/e5u6ttVKLkGDSLFuuj5L6Y9TsmwYmGBTnu9
 peu//TK+tyw5ClqYjaEonRHKisb04f9DhMlBJuWh/XUe2mOlZPRdHpRMbMEKKTGXG9lF
 srUhfO4AZY39Fo3znIj5lacWZPyDUo6ZWKyX+JIWsPoG3jOjukG1Zldm15+FM16uM1lY
 bWTQ==
X-Gm-Message-State: AO0yUKVcHugb2S9gLV9w9KZY9p2FUULU87o5NBT1CuDweSgb0IXKDS+t
 pmylXdGfLRpe0RrasVEvhSREpA==
X-Google-Smtp-Source: AK7set/eMw/OTCfWM+qcnpe0fvIZLj5VwP+nBvPdyhEHct4AV3vuQ1Gw+aPhqva031kCDvgYXDboyg==
X-Received: by 2002:a17:906:9c86:b0:914:4277:f3e1 with SMTP id
 fj6-20020a1709069c8600b009144277f3e1mr11340126ejc.53.1678359342896; 
 Thu, 09 Mar 2023 02:55:42 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 hb15-20020a170906b88f00b008d09b900614sm8614241ejb.80.2023.03.09.02.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 02:55:42 -0800 (PST)
Date: Thu, 9 Mar 2023 10:55:39 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20230309105539.GA83145@aspen.lan>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302195618.156940-1-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 02, 2023 at 09:02:00PM +0106, John Ogness wrote:
 > Hi, > > This is v1 of a series to bring in a new threaded/atomic console
 > infrastructure. The history, motivation, and various explanati [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
X-Headers-End: 1paDw9-0001T9-F5
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 00/18] threaded/atomic
 console support
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, Petr Mladek <pmladek@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 rcu@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, tangmeng <tangmeng@uniontech.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Mar 02, 2023 at 09:02:00PM +0106, John Ogness wrote:
> Hi,
>
> This is v1 of a series to bring in a new threaded/atomic console
> infrastructure. The history, motivation, and various explanations and
> examples are available in the cover letter of tglx's RFC series
> [0]. From that series, patches 1-18 have been mainlined as of the 6.3
> merge window. What remains, patches 19-29, is what this series
> represents.

So I grabbed the whole series and pointed it at the kgdb test suite.

Don't get too excited about that (the test suite only exercises 8250
and PL011... and IIUC little in the set should impact UART polling
anyway) but FWIW:
Tested-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
