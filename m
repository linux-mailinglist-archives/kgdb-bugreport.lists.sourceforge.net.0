Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDA80615C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Dec 2023 23:06:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rAdYK-0003PS-10
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 05 Dec 2023 22:06:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rAdYI-0003PM-Iv
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 05 Dec 2023 22:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6YS5yNlvl+FKFyGS3DIWxbNX8VWKvkEW8slTswnooc=; b=KgkagQ29c/unkw/p0mUj5DI5XH
 gngYhDjMgWBP7g0mK84Fnd75Hilg2tkMFcx/OtGggXcJt1V8n/g99hBdSVmb8lRKxAo2yqyb0wEDh
 wcgrzWGxOevQOXPT93z+7rPmR8Cw2Q7aK1T+pHX/FK5foqGQfKbJ22qM1xRzIsZNV2to=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q6YS5yNlvl+FKFyGS3DIWxbNX8VWKvkEW8slTswnooc=; b=B/aM68v4KSfNyeJbusdcpwotuE
 undRpDDh1Wgd7Lkc8ZSRVw/2qHGhN7dvpgdZN2xsJq63Awi/PFqyqnRTtPMEflMi3IjH+u2TnaKOg
 IzJI6bo72+HI8Pa7q+nRPdP611u1i455MpW+D+ETvFNFlz/WImG1PecCXk6JvH8IfgM8=;
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAdYF-0004vO-Kw for kgdb-bugreport@lists.sourceforge.net;
 Tue, 05 Dec 2023 22:06:02 +0000
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-77dd07e7d39so420504585a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Dec 2023 14:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701813948; x=1702418748;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6YS5yNlvl+FKFyGS3DIWxbNX8VWKvkEW8slTswnooc=;
 b=l9u7l8v48IGnPGo3wwQ/51Zlr0rXNJ0UZI7dOjSofPsgQZA1Tn5uSMR6L9WSMHNaD0
 o/bHWJ/winyZUCRB2+wW2VB5mJUTCBh+nMSH7+8u8hNh9ccvoVZtUmSjFxdic5rUj2JC
 vEAbrvwIVrpoirwqFZHunRPA21i2zzYoZNRtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701813948; x=1702418748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q6YS5yNlvl+FKFyGS3DIWxbNX8VWKvkEW8slTswnooc=;
 b=P8oHqtacp5gO9jaSKunwI9BVVtPZMtG3nYm8AgnaAPHwiBf+vjMz4E5KeB8J1Mq82s
 L9kweGcoUrY8vMPzzXg/P6Xwjxr0uISvVNUZoT1Cn9J+smfM3n0F09Edj5YHbJwtvO6I
 oJ7Z0I0zvm7VLxJr6PjGpJOWfyYDp1fdGwc2YWzg/mE0TCC6fTeYn9/jGt7Fv1mbZ41G
 E4wnyscCHGIPwVJl064c7Ma0paGwNo/ibnOG0esMQb+gMgeNpXKyXPCpNEDjElMSzh56
 c47VzbfgdpFaQMvcUKhUb8FtEKYhn9ikXk8Bl7F33yZ2Tn279KCL0toM0Rzow85SEdW/
 GiDw==
X-Gm-Message-State: AOJu0YyzHOkcUXHLaihd+WAUbTmGEqpRtHs8vm7u5iKvnYYqb28vKGcW
 waOHWRKGVK9kd5Q/qe5F+Ctio075usbFvJm1A0sDUWaH
X-Google-Smtp-Source: AGHT+IHOo0/UlSF4jmLmgubGmTGBKsBgfIB/YNO27E3Qdly3tEyiglMG+J0HJ0yL9jH0fJiPGPHZnQ==
X-Received: by 2002:a05:6214:500c:b0:67a:a42b:58a4 with SMTP id
 jo12-20020a056214500c00b0067aa42b58a4mr2880636qvb.20.1701812531440; 
 Tue, 05 Dec 2023 13:42:11 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 f15-20020a0ccc8f000000b0067a276fd8d5sm4083702qvl.54.2023.12.05.13.42.10
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 13:42:10 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-423e04781d3so96291cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Dec 2023 13:42:10 -0800 (PST)
X-Received: by 2002:a05:622a:4ce:b0:425:4823:f9a3 with SMTP id
 q14-20020a05622a04ce00b004254823f9a3mr60587qtx.2.1701812530294; Tue, 05 Dec
 2023 13:42:10 -0800 (PST)
MIME-Version: 1.0
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 13:41:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
Message-ID: <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
To: Yuran Pereira <yuran.pereira@hotmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, Nov 19, 2023 at 4:10 PM Yuran Pereira <yuran.pereira@hotmail.com>
    wrote: > > The function simple_strtoul performs no error checking in scenarios
    > where the input value overflows the intende [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.174 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.174 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rAdYF-0004vO-Kw
Subject: Re: [Kgdb-bugreport] [PATCH 2/2] trace: kdb: Replace simple_strtoul
 with kstrtoul in kdb_ftdump
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIE5vdiAxOSwgMjAyMyBhdCA0OjEw4oCvUE0gWXVyYW4gUGVyZWlyYSA8eXVy
YW4ucGVyZWlyYUBob3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gc2ltcGxlX3N0
cnRvdWwgcGVyZm9ybXMgbm8gZXJyb3IgY2hlY2tpbmcgaW4gc2NlbmFyaW9zCj4gd2hlcmUgdGhl
IGlucHV0IHZhbHVlIG92ZXJmbG93cyB0aGUgaW50ZW5kZWQgb3V0cHV0IHZhcmlhYmxlLgo+IFRo
aXMgcmVzdWx0cyBpbiB0aGlzIGZ1bmN0aW9uIHN1Y2Nlc3NmdWxseSByZXR1cm5pbmcsIGV2ZW4g
d2hlbiB0aGUKPiBvdXRwdXQgZG9lcyBub3QgbWF0Y2ggdGhlIGlucHV0IHN0cmluZyAoYWthIHRo
ZSBmdW5jdGlvbiByZXR1cm5zCj4gc3VjY2Vzc2Z1bGx5IGV2ZW4gd2hlbiB0aGUgcmVzdWx0IGlz
IHdyb25nKS4KPgo+IE9yIGFzIGl0IHdhcyBtZW50aW9uZWQgWzFdLCAiLi4uc2ltcGxlX3N0cnRv
bCgpLCBzaW1wbGVfc3RydG9sbCgpLAo+IHNpbXBsZV9zdHJ0b3VsKCksIGFuZCBzaW1wbGVfc3Ry
dG91bGwoKSBmdW5jdGlvbnMgZXhwbGljaXRseSBpZ25vcmUKPiBvdmVyZmxvd3MsIHdoaWNoIG1h
eSBsZWFkIHRvIHVuZXhwZWN0ZWQgcmVzdWx0cyBpbiBjYWxsZXJzLiIKPiBIZW5jZSwgdGhlIHVz
ZSBvZiB0aG9zZSBmdW5jdGlvbnMgaXMgZGlzY291cmFnZWQuCj4KPiBUaGlzIHBhdGNoIHJlcGxh
Y2VzIGFsbCB1c2VzIG9mIHRoZSBzaW1wbGVfc3RydG91bCB3aXRoIHRoZSBzYWZlcgo+IGFsdGVy
bmF0aXZlcyBrc3RydG9pbnQgYW5kIGtzdHJ0b2wuCj4KPiBbMV0gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjc2ltcGxlLXN0cnRv
bC1zaW1wbGUtc3RydG9sbC1zaW1wbGUtc3RydG91bC1zaW1wbGUtc3RydG91bGwKPgo+IFNpZ25l
ZC1vZmYtYnk6IFl1cmFuIFBlcmVpcmEgPHl1cmFuLnBlcmVpcmFAaG90bWFpbC5jb20+Cj4gLS0t
Cj4gIGtlcm5lbC90cmFjZS90cmFjZV9rZGIuYyB8IDE0ICsrKysrKy0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jIGIva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jCj4g
aW5kZXggNTk4NTdhMWVlNDRjLi4zODkxZjg4NWU0YTYgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL3Ry
YWNlL3RyYWNlX2tkYi5jCj4gKysrIGIva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jCj4gQEAgLTk2
LDIzICs5NiwyMSBAQCBzdGF0aWMgaW50IGtkYl9mdGR1bXAoaW50IGFyZ2MsIGNvbnN0IGNoYXIg
Kiphcmd2KQo+ICB7Cj4gICAgICAgICBpbnQgc2tpcF9lbnRyaWVzID0gMDsKPiAgICAgICAgIGxv
bmcgY3B1X2ZpbGU7Cj4gLSAgICAgICBjaGFyICpjcDsKPiArICAgICAgIGludCBlcnI7Cj4gICAg
ICAgICBpbnQgY250Owo+ICAgICAgICAgaW50IGNwdTsKPgo+ICAgICAgICAgaWYgKGFyZ2MgPiAy
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gS0RCX0FSR0NPVU5UOwo+Cj4gLSAgICAgICBpZiAo
YXJnYykgewo+IC0gICAgICAgICAgICAgICBza2lwX2VudHJpZXMgPSBzaW1wbGVfc3RydG9sKGFy
Z3ZbMV0sICZjcCwgMCk7Cj4gLSAgICAgICAgICAgICAgIGlmICgqY3ApCj4gKyAgICAgICBpZiAo
YXJnYykKPiArICAgICAgICAgICAgICAgaWYgKGtzdHJ0b2ludChhcmd2WzFdLCAwLCAmc2tpcF9l
bnRyaWVzKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBza2lwX2VudHJpZXMgPSAwOwo+IC0g
ICAgICAgfQoKU2ltaWxhciBuaXQgYWJvdXQgYnJhY2VzIGFzIGluIHBhdGNoICMxLiB0bDtkciBp
cyBjaGFuZ2UgdGhlIGFib3ZlIHRvOgoKaWYgKGFyZ2MgJiYga3N0cnRvaW50KGFyZ3ZbMV0sIDAs
ICZza2lwX2VudHJpZXMpKQogIHNraXBfZW50cmllcyA9IDA7CgoKPgo+ICAgICAgICAgaWYgKGFy
Z2MgPT0gMikgewo+IC0gICAgICAgICAgICAgICBjcHVfZmlsZSA9IHNpbXBsZV9zdHJ0b2woYXJn
dlsyXSwgJmNwLCAwKTsKPiAtICAgICAgICAgICAgICAgaWYgKCpjcCB8fCBjcHVfZmlsZSA+PSBO
Ul9DUFVTIHx8IGNwdV9maWxlIDwgMCB8fAo+IC0gICAgICAgICAgICAgICAgICAgIWNwdV9vbmxp
bmUoY3B1X2ZpbGUpKQo+ICsgICAgICAgICAgICAgICBlcnIgPSBrc3RydG9sKGFyZ3ZbMl0sIDAs
ICZjcHVfZmlsZSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIgfHwgY3B1X2ZpbGUgPj0gTlJf
Q1BVUyB8fCBjcHVfZmlsZSA8IDAgfHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICFjcHVfb25saW5lKGNwdV9maWxlKSkKCm5pdDogd2h5IGRpZCB5b3UgY2hhbmdlIHRoZSBpbmRl
bnRhdGlvbiBmb3IgIiFjcHVfb25saW5lKGNwdV9maWxlKSkiPwpJdCBzZWVtZWQgYmV0dGVyIGJl
Zm9yZS4KCldpdGggbml0cyBmaXhlZDoKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
