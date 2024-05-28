Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFD8D220B
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 May 2024 18:55:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sC073-0000O8-VM
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 May 2024 16:55:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sC072-0000O0-QY
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 May 2024 16:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJl/Niw9y8xeoAZXxTzkK3BRrY+A+J2TquBBGpBsalE=; b=RMes36NWPt9zF/8Bv/0/62Ouof
 ZCIWG1+Imz3grgfCqIf2zNYzzl1jRuYZzrK37vwxq+O9IFzhebHAmZVsi6rAHXkykGmxBxhHn3y+6
 +DyXBYPhwPwEvNOsFjP+TdKpqZXSDQBC8suavZrXXRGPhaEXqhBdZqtKR9mGSjrW8lTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gJl/Niw9y8xeoAZXxTzkK3BRrY+A+J2TquBBGpBsalE=; b=hOuvrsCUIuZz1RsHqJtsFnIW17
 4F5S6hViukwmZggj8ch5fHVuGIabYpQTlxQfGJ6T5jx+muQMhskYUzhroirdvXvQIKHvgW+Qu6v6k
 YnYro5pCCB/l+d1+hJ+OQZl/BFVsjDiVdAtc7XteR6fGw8+/QE5d3LZP0CFwOZoef1mk=;
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sC072-00085x-CN for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 May 2024 16:55:48 +0000
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3d1d11cb556so393257b6e.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 May 2024 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716915337; x=1717520137;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJl/Niw9y8xeoAZXxTzkK3BRrY+A+J2TquBBGpBsalE=;
 b=ayQaBPWFZSZMtR5uXlNnZhcXUcoXibJDqWLjluqNrw582d3LaOwWQOrHVe1nNiTX+A
 mwnGgYzuQ/MPDduEcAo07WKeqcJBhArVn9F+tmCOOMf/CfC3BBOFeYNcGqefjXrDJm/v
 +qIARPonkXFtJPxbEY8I+jmH9wpUra/ccJhAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716915337; x=1717520137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJl/Niw9y8xeoAZXxTzkK3BRrY+A+J2TquBBGpBsalE=;
 b=O3pVXoybTIDGeKS+p/FFqSzZBUdBQ8mq9taWFfwUpgvnJ+aXDk6Z5UnFSYyo3uSDP5
 xBnc6W2LqfZuJ4KkNUeI0VEMYUTHaj566mTY5/eG59izAKV8Ld5k8nEv9i+pnunnD/D0
 JNT+MwS18u6w8kNQN+P+EA7W52VoNqe2fwXji+Jch3meKsFTGfehHGN/Gl9V0vUdKeJ3
 suMuYKKAbf54PL8bz92PYugJFvjK1HXaimmWdIstu4HEhBKnBmbecevGzTo3w/cddiyK
 skQSesaxvfRv9cz0RAbtUPtoYdPa6CN7OdqsIviWKB9p3k45cv6cFSNVIGzwFGRwzwSg
 wuXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFecekjz0aDGGOWnJSrQapoPrCdLDQrub4fbFckHBM8v/ImU8DuWO7h8ShvjSne02xH9rQCq2VTh4bGfMTRNdHg/vQ7ZdS36JTr/JskspIYArwsXY=
X-Gm-Message-State: AOJu0Yy4xxnglQGOaTxnJndREiUqhAKsnN630VvM22xUm7q4AcCG/KFq
 hjMhyv8w20ZoLL23BUyekge5Yrb7qdjMxHmooHtgEnIe/4EHbbdVMYriClJhq1E/ScVVOJ5vlkc
 =
X-Google-Smtp-Source: AGHT+IHGAhrbjdcvcIJbKUq9lytPUHzrKxupRHoiMhknguAHCj1ceWKNgFKDi05tVjy1U4IhxfVR5Q==
X-Received: by 2002:a05:6122:3122:b0:4da:e6ee:5533 with SMTP id
 71dfb90a1353d-4e4f02fbb91mr12054298e0c.16.1716903723875; 
 Tue, 28 May 2024 06:42:03 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abcdb512sm382428285a.61.2024.05.28.06.42.02
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 06:42:03 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43f87dd6866so881851cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 May 2024 06:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEf8kB7b1TJKIbT8HbismQskqNtKFXFum2aPEaoJUWdMJrIJYtSO7fYZxvnX7GzRDdwFmzCNAeRRsa//Ep3qtxBVKgPYYcyAOXASSHpGfjqYb6FHM=
X-Received: by 2002:a05:622a:59ce:b0:43b:6b6:8cad with SMTP id
 d75a77b69052e-43fb9f403f9mr7315341cf.10.1716903722340; Tue, 28 May 2024
 06:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240528121154.3662553-1-arnd@kernel.org>
In-Reply-To: <20240528121154.3662553-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 May 2024 06:41:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=BW3qjhn=Lp=vb6d1wHaUF6M98DUssEz-zZkL2TU=mw@mail.gmail.com>
Message-ID: <CAD=FV=U=BW3qjhn=Lp=vb6d1wHaUF6M98DUssEz-zZkL2TU=mw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, May 28, 2024 at 5:12 AM Arnd Bergmann <arnd@kernel.org>
    wrote: > > From: Arnd Bergmann <arnd@arndb.de> > > When -Wformat-security
    is not disabled, using a string pointer > as a format causes [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.170 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.170 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.167.170 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sC072-00085x-CN
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: address -Wformat-security warnings
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
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIE1heSAyOCwgMjAyNCBhdCA1OjEy4oCvQU0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4KPiBXaGVuIC1XZm9ybWF0LXNlY3VyaXR5IGlzIG5vdCBkaXNhYmxlZCwgdXNpbmcgYSBz
dHJpbmcgcG9pbnRlcgo+IGFzIGEgZm9ybWF0IGNhdXNlcyBhIHdhcm5pbmc6Cj4KPiBrZXJuZWwv
ZGVidWcva2RiL2tkYl9pby5jOiBJbiBmdW5jdGlvbiAna2RiX3JlYWQnOgo+IGtlcm5lbC9kZWJ1
Zy9rZGIva2RiX2lvLmM6MzY1OjM2OiBlcnJvcjogZm9ybWF0IG5vdCBhIHN0cmluZyBsaXRlcmFs
IGFuZCBubyBmb3JtYXQgYXJndW1lbnRzIFstV2Vycm9yPWZvcm1hdC1zZWN1cml0eV0KPiAgIDM2
NSB8ICAgICAgICAgICAgICAgICAgICAgICAgIGtkYl9wcmludGYoa2RiX3Byb21wdF9zdHIpOwo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fgo+IGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmM6IEluIGZ1bmN0aW9uICdrZGJfZ2V0c3RyJzoK
PiBrZXJuZWwvZGVidWcva2RiL2tkYl9pby5jOjQ1NjoyMDogZXJyb3I6IGZvcm1hdCBub3QgYSBz
dHJpbmcgbGl0ZXJhbCBhbmQgbm8gZm9ybWF0IGFyZ3VtZW50cyBbLVdlcnJvcj1mb3JtYXQtc2Vj
dXJpdHldCj4gICA0NTYgfCAgICAgICAgIGtkYl9wcmludGYoa2RiX3Byb21wdF9zdHIpOwo+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+Cj4KPiBVc2UgYW4gZXhwbGNp
dCAiJXMiIGZvcm1hdCBpbnN0ZWFkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYyB8IDQgKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKRml4
ZXM6IDVkNTMxNGQ2Nzk1ZiAoImtkYjogY29yZSBmb3Iga2dkYiBiYWNrIGVuZCAoMSBvZiAyKSIp
ClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cgou
Li5wcm9iYWJseSBhbHNvIGp1c3RpZmllcyBhOgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
CgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
